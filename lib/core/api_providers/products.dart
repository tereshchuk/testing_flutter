import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:flutter_testing/core/models/product.dart';

// This is necessary for the generator to work.
part "products.chopper.dart";

@ChopperApi(baseUrl: "/v1/c940dc7f-7dda-46d8-b9bf-f959d42bdde2")
abstract class TodosListService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  static TodosListService create(ChopperClient chopperClient) {
    final client = ChopperClient(
      baseUrl: "https://mocki.io",
      services: [
        _$TodosListService(),
      ],
    );
    return _$TodosListService(client);
  }
}
