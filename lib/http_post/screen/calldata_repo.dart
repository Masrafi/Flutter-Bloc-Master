import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/http_post/bloc/app_bloc.dart';
import 'package:log_registration_bloc/http_post/bloc/app_event.dart';
import 'package:log_registration_bloc/http_post/bloc/app_state.dart';
import 'package:log_registration_bloc/http_post/model/model.dart';

class CallDataRepo extends StatefulWidget {
  const CallDataRepo({Key? key}) : super(key: key);

  @override
  State<CallDataRepo> createState() => _CallDataRepoState();
}

class _CallDataRepoState extends State<CallDataRepo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Data"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoaded) {
          List<ProductModel> data = state.mydata;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index].name),
                    trailing: Text(data[index].price),
                  ),
                );
              });
        } else if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
