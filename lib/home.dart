import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/config/darkmode.dart';
import 'package:hypeneedz/domain/Entitys/product.dart';

import 'application/products/watchert/product_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
        if (state is ProductLoaded) {
          final products = state.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, index) {
              final Product product = products[index];
              return Column(children: [
                Text(product.title,
                    style: (Theme.of(context).textTheme.headline1)?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w900)),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      image:
                          DecorationImage(image: NetworkImage(product.image))),
                ),
                Text(product.id,
                    style: (Theme.of(context).textTheme.headline1)
                        ?.copyWith(fontWeight: FontWeight.w900)),
                Text(
                  product.price.toString(),
                ),
                const DarkModeToggle()
              ]);
            },
          );
        } else {
          return const Center(
            child: Text("Something Went Wrong"),
          );
        }
      },
    ));
  }
}
