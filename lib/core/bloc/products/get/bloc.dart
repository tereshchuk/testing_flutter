import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/models/product.dart';
import 'package:flutter_testing/core/repositories/products.dart';
import 'event.dart';
import 'state.dart';

class ProductsGetBloc extends Bloc<ProductsGetEvent, ProductsGetState> {
  ProductsGetBloc() : super(ProductsGetInitialState());

  @override
  Stream<ProductsGetState> mapEventToState(ProductsGetEvent event) async* {
    if (event is ProductsGetRequested) {
      yield* _mapFaqRequestedToState();
    }
  }

  Stream<ProductsGetState> _mapFaqRequestedToState() async* {
    yield ProductsGetLoadingState();
    try {
      List<Product> dataProducts = await ProductsRepository.get();
      yield ProductsGetSuccessState(dataProducts: dataProducts);
    } on PlatformException catch (e) {
      yield ProductsGetErrorState(message: e.code);
    }
  }
}
