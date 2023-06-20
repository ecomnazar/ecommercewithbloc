import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finalapp/api/get_api.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(ApiLoadingState(products: [], bestProducts: [], newProducts: const [])) {
    on<GetAllProducts>((GetAllProducts event, Emitter<GetApiState> emit) async{
      emit(ApiLoadingState(products: const [], bestProducts: const [], newProducts: const []));
      final products = await GetApi().getTopProducts();
      final bestProducts = await GetApi().getBestProducts();
      final newProducts = await GetApi().getNewProducts();
      emit(GetApiState(products: products, bestProducts: bestProducts, newProducts: newProducts));
    });
  }
}
