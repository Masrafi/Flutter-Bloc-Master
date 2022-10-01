import 'package:flutter/material.dart';
import 'package:log_registration_bloc/data_get_api/model/user_model.dart';

class ViewDataAPI extends StatelessWidget {
  const ViewDataAPI({Key? key, required this.model}) : super(key: key);
  final UserModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(model.avatar),
              ),
            ),
            Center(
              child: Text(
                model.firstName + " " + model.lastName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
