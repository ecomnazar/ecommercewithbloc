part of 'cart_bloc_bloc.dart';

class CartBlocState extends Equatable {
  
  final List cartItems;

  CartBlocState({ required this.cartItems });

  @override
  List<Object> get props => [cartItems];
}
