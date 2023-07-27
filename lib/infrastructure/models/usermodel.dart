import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/Entitys/main_user.dart';

class UserModel {
  final String id;
  final String username;
  final String number;
  final String image;
  final String bio;
  final bool private;
  final bool admin;
  // final Subscription subscription;

  UserModel({
    required this.id,
    required this.username,
    required this.number,
    required this.image,
    required this.bio,
    required this.private,
    required this.admin,
    // required this.subscription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'number': number,
      'image': image,
      'bio': bio,
      'private': private,
      'admin': admin,
      // 'subscription': subscription.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      number: map['number'],
      image: map['image'],
      bio: map['bio'],
      private: map['private'],
      admin: map['admin'],
      //  subscription: Subscription.fromMap(map['subscription']),
    );
  }

  factory UserModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc, String id) {
    return UserModel.fromMap(doc.data()).copyWith(id: id);
  }
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? id,
    String? username,
    String? number,
    String? image,
    String? bio,
    bool? private,
    bool? admin,
    // Subscription? subscription,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      number: number ?? this.number,
      image: image ?? this.image,
      bio: bio ?? this.bio,
      private: private ?? this.private,
      admin: admin ?? this.admin,
      // subscription: subscription ?? this.subscription,
    );
  }

  MainUser toDomain() {
    return MainUser(
      id: id,
      username: username,
      number: number,
      image: image,
      bio: bio,
      private: private,
      admin: admin,
      //subscription: subscription,
    );
  }

  factory UserModel.fromDomain(MainUser userItem) {
    return UserModel(
        id: userItem.id,
        username: userItem.username,
        number: userItem.number,
        image: userItem.image,
        bio: userItem.bio,
        private: userItem.private,
        admin: userItem.admin);
    // subscription: userItem.subscription);
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final dynamic data = doc.data();
    return UserModel(
      id: doc['id'],
      username: data['username'],
      number: data['number'],
      image: data['image'],
      bio: data['bio'],
      private: data['private'],
      admin: data['admin'],
      // subscription: Subscription.fromMap(data['subscription']
    );
  }
}
