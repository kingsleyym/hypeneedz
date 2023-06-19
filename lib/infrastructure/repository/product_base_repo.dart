import 'package:hypeneedz/domain/Entitys/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getProducts();
  Future<void> addNewProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(Product product);
}
