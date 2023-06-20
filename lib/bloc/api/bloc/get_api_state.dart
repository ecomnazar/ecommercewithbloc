part of 'get_api_bloc.dart';

class GetApiState extends Equatable {
  final List products;
  final List bestProducts;
  final List newProducts;
  GetApiState({required this.products, required this.bestProducts, required this.newProducts});

  @override
  List<Object> get props => [products, bestProducts, newProducts];
}

class ApiLoadingState extends GetApiState{
  ApiLoadingState({required super.products, required super.bestProducts, required super.newProducts});
}