part of 'observer_bloc_bloc.dart';

abstract class ShoesObserverState extends Equatable {
  const ShoesObserverState();

  @override
  List<Object> get props => [];
}

class ShoesObserverInitial extends ShoesObserverState {}

class ShoesObserverLoading extends ShoesObserverState {}

class ShoesObserverSucsses extends ShoesObserverState {
  final List<Shoes> shoes;
  const ShoesObserverSucsses(this.shoes);
  @override
  List<Object> get props => [shoes];
}

class ShoesObserverFailure extends ShoesObserverState {
  final ShoesFailure shoesFailure;
  const ShoesObserverFailure(this.shoesFailure);
  @override
  List<Object> get props => [shoesFailure];
}
