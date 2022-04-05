import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

import 'core/bloc/products/get/bloc.dart';
import 'core/bloc/products/get/event.dart';
import 'core/helpers/global_variables.dart';
import 'ui/products/list.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => getIt<ProductsGetBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> setUp() async {
  getIt.registerSingleton<ProductsGetBloc>(ProductsGetBloc());
  getIt<ProductsGetBloc>().add(ProductsGetRequested());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Test',
        theme: ThemeProvider.themeData,
        debugShowCheckedModeBanner: false,
        home: const ProductsScreen());
  }
}
