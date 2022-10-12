import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../bloc/app_state.dart';
import '../repo/product_repo.dart';
import 'http_post_home.dart';

class HttpCheck extends StatelessWidget {
  const HttpCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => ProductBloc(
          productRepository: RepositoryProvider.of<ProductRepository>(context)),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
            if (state is ProductAdded) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Product added"),
                duration: Duration(seconds: 2),
              ));
            }
          }, child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductAdding) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductError) {
                return const Center(child: Text("Error"));
              }
              return const HomePage();
            },
          ))),
    );
  }
}
