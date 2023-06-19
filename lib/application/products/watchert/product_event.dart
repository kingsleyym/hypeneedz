part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  final List<Product> products;

  const LoadProduct(this.products);

  @override
  List<Object> get props => [products];
}
