import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:log_registration_bloc/data_get_api/model/user_model.dart';

@immutable
abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
//data doades state

//datra error loading state
