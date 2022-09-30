import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/sign_in/bloc/signin_event.dart';
import 'package:log_registration_bloc/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email"));
      } else if (event.passwordValue.length <= 7) {
        emit(SignInErrorState("Please enter a valiod password"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
      if (event.email != null && event.password != null) {
        print("This is navigation screen");
      }
    });
  }
}
