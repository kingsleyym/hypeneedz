import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hypeneedz/infrastructure/repository/product_base_repo.dart';

import '../../domain/Entitys/product.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> addNewProduct(Product product) async {
    return _firebaseFirestore
        .collection('products')
        .doc(product.id)
        .set(product.toMap());
  }

  @override
  Future<void> deleteProduct(Product product) {
    return _firebaseFirestore.collection('products').doc(product.id).delete();
  }

  @override
  Future<void> updateProduct(Product product) {
    return _firebaseFirestore
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }
}
