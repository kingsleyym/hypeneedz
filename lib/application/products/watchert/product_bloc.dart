import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/Entitys/product.dart';
import '../../../infrastructure/repository/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepositoy;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepositoy = productRepository,
        super(ProductInitial()) {
    on<LoadProduct>(_onLoadProducts);

    _productSubscription = _productRepositoy
        .getProducts()
        .listen((products) => add(LoadProduct(products)));
  }

  void _onLoadProducts(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoaded(event.products));
  }

  @override
  Future<void> close() async {
    _productSubscription?.cancel();
    super.close();
  }
}
