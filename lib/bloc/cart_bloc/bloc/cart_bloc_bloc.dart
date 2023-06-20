import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocState(cartItems: [])) {
    on<OnClickAddButton>((OnClickAddButton event, Emitter<CartBlocState> emit){
      final state = this.state;
      // print(event.oneProductList);
      emit(CartBlocState(cartItems: List.from(state.cartItems)..add(event.oneProductList)));
      print(state.cartItems);
    });
    on<OnClickCloseButton>((OnClickCloseButton event, Emitter<CartBlocState> emit){
      final state = this.state;
      emit(CartBlocState(cartItems: List.from(state.cartItems)..remove(event.oneProductList)));
    });
  }
}
