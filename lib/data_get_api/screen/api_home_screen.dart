import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import '../model/user_model.dart';
import '../repository/repository.dart';

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({Key? key}) : super(key: key);

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<Repository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("The bloc app"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/viewdataAPI', arguments: {
                        'model': userList[index],
                      });
                    },
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].firstName,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userList[index].lastName,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text("Error"),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }
}
