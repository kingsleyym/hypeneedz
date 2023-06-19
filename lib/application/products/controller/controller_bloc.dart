import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/Entitys/product.dart';
import '../../../infrastructure/repository/product_repo.dart';
part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  final ProductRepository productRepositoy;

  ControllerBloc({required this.productRepositoy})
      : super(ControllerInitial()) {
    on<DeleteProductEvent>((event, emit) async {
      emit(ControllerInProgress());
      try {
        await productRepositoy.deleteProduct(event.product);
        emit(ControllerSuccess());
      } catch (_) {
        emit(ControllerInitial());
      }
    });
    on<UpdateProductEvent>((event, emit) async {
      emit(ControllerInProgress());
      try {
        await productRepositoy.updateProduct(event.product.copyWith(
          available: event.available,
        ));
        emit(ControllerSuccess());
      } catch (_) {
        emit(ControllerInitial());
      }
    });
  }
}
