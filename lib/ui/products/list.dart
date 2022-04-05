import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_testing/core/bloc/products/get/bloc.dart';
import 'package:flutter_testing/core/bloc/products/get/state.dart';
import 'package:flutter_testing/core/models/product.dart';
import 'package:flutter_testing/core/repositories/products.dart';

import '../theme.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            backgroundColor: ThemeProvider.lightGrey2,
            appBar: AppBar(
                backgroundColor: ThemeProvider.lightGrey2,
                title: const Text(
                  "Shop",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                )),
            body: buildUserProfileStream()));
  }

  buildUserProfileStream() {
    final bloc = BlocProvider.of<ProductsGetBloc>(context);

    return StreamBuilder<List<Product>>(
      stream: bloc.dataProductsStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Product>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return buildBody(snapshot.data!);
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }

  Widget buildUserProfileBloc() {
    return BlocBuilder<ProductsGetBloc, ProductsGetState>(
        builder: (BuildContext context, ProductsGetState state) {
      if (state is ProductsGetLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ProductsGetErrorState) {
        return Container();
      }
      if (state is ProductsGetSuccessState) {
        return buildBody(state.dataProducts);
      }

      return Container();
    });
  }

  Widget buildBody(List<Product> dataProducts) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return _card(dataProducts[index]);
          }, childCount: dataProducts.length),
        ),
      ],
    );
  }

  Widget _card(Product product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    "From",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${product.price}",
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      borderRadius: BorderRadius.circular(100),
                      // When the user taps the button, show a snackbar.
                      onTap: () {},
                      child: Ink(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(Icons.shopping_basket,
                              color: Colors.white)))
                ],
              ),
              const SizedBox(width: 25),
              Expanded(
                  child: Image.network(
                      "https://via.placeholder.com/350x150", //dataProducts[index].image!,
                      height: 150,
                      fit: BoxFit.cover,
                      width: double.infinity))
            ],
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              product.category!,
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(product.rating!.rate.toString(),
                        style: const TextStyle(color: Colors.white))),
                const SizedBox(width: 15),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(product.rating!.count.toString(),
                        style: const TextStyle(color: Colors.white))),
              ],
            )
          ]),
          const SizedBox(height: 15),
          Text(
            product.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            product.description!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 7),
          Divider()
        ],
      ),
    );
  }
}
