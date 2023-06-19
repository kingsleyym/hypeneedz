part of 'controller_bloc.dart';

abstract class ControllerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteProductEvent extends ControllerEvent {
  final Product product;
  DeleteProductEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class UpdateProductEvent extends ControllerEvent {
  final Product product;
  final bool available;
  UpdateProductEvent({required this.available, required this.product});
  @override
  List<Object> get props => [product, available];
}
