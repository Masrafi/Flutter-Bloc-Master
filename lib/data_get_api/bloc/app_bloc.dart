import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/data_get_api/bloc/app_event.dart';
import 'package:log_registration_bloc/data_get_api/bloc/app_state.dart';
import '../repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository _repository;

  UserBloc(this._repository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await _repository.getUsers();
        emit(UserLoadedState(user));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
