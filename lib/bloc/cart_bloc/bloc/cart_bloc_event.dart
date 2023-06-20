part of 'cart_bloc_bloc.dart';

abstract class CartBlocEvent extends Equatable {
  const CartBlocEvent();

  @override
  List<Object> get props => [];
}

class OnClickAddButton extends CartBlocEvent{
  final oneProductList;

  OnClickAddButton({ required this.oneProductList });
  @override
  List<Object> get props => [oneProductList];
}

class OnClickCloseButton extends CartBlocEvent{
  final oneProductList;

  OnClickCloseButton({ required this.oneProductList });
  @override
  List<Object> get props => [oneProductList];
}