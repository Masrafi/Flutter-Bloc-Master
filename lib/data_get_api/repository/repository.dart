import 'dart:convert';

import 'package:http/http.dart';
import 'package:log_registration_bloc/data_get_api/model/user_model.dart';

class Repository {
  String endPoint = "https://reqres.in/api/users?page=2";
  getUsers() async {
    Response response = await get(Uri.parse(endPoint));
    print(response.body);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
