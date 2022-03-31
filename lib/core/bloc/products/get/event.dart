import 'package:flutter/widgets.dart';

@immutable
abstract class ProductsGetEvent {
  const ProductsGetEvent();
}

class ProductsGetRequested extends ProductsGetEvent {
  @override
  String toString() => 'ProductsGetRequested';
}
