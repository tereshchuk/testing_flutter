import 'package:flutter_testing/core/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductsGetState {}

class ProductsGetInitialState extends ProductsGetState {
  @override
  String toString() => 'ProductsGetInitialState';
}

class ProductsGetLoadingState extends ProductsGetState {
  @override
  String toString() => 'ProductsGetLoadingState';
}

class ProductsGetSuccessState extends ProductsGetState {
  final List<Product> dataProducts;

  ProductsGetSuccessState({required this.dataProducts});

  @override
  String toString() => 'ProductsGetSuccessState';
}

class ProductsGetErrorState extends ProductsGetState {
  final String message;

  ProductsGetErrorState({required this.message});

  @override
  String toString() => 'ProductsGetErrorState';
}
