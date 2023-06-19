import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hypeneedz/domain/Entitys/user.dart';

import '../../core/failures/auth_failures.dart';
import '../../domain/repository/auth_repository.dart';

import 'package:hypeneedz/infrastructure/extensions/firebase_user_maper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = firebaseAuth.currentUser;
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set({
        "id": user.uid,
        "email": email,
        "password": password,
      });
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(EmailAlreadyInUseFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      final firestore = FirebaseFirestore.instance;
      final user = firebaseAuth.currentUser;
      final userId = user!.uid;

      // Check if the user exists in the "users" collection
      final userSnapshot =
          await firestore.collection("users").doc(userId).get();

      if (!userSnapshot.exists) {
        // Create a new document for the user in the "users" collection
        await firestore.collection("users").doc(userId).set({
          "id": userId,
          "email": email,
          "password": password,
          "createdAt": DateTime.now().millisecondsSinceEpoch,
          "admin": false,
          "bio": "",
          "name": user.displayName,
          "profilePicture": user.photoURL,
          "username": "",
          "followers": 0,
          "following": 0,
          "courses": 0,
        });
      }
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(InvalidEmailAndPasswordCombinationFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return left(CancelledByUserFailure());
      }
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(authCredential);
      final user = firebaseAuth.currentUser;
      final firestore = FirebaseFirestore.instance;
      final userId = user!.uid;

      // Check if the user exists in the "users" collection
      final userSnapshot =
          await firestore.collection("users").doc(userId).get();

      if (!userSnapshot.exists) {
        await firestore.collection("users").doc(userId).set({
          "id": userId,
          "email": user.email,
          "createdAt": DateTime.now().timeZoneName,
          "admin": false,
          "bio": "",
          "name": "",
          "image": user.photoURL,
          "username": user.displayName,
          "followers": 0,
          "following": 0,
          "courses": 0,
        });
      }

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        return left(AccountExistsWithDifferentCredentialFailure());
      } else if (e.code == "invalid-credential") {
        return left(InvalidCredentialFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<void> signOut() => Future.wait({
        firebaseAuth.signOut(),
      });

  @override
  Option<MyUser> getSignedInUser() =>
      optionOf(firebaseAuth.currentUser?.toDomain());
}
