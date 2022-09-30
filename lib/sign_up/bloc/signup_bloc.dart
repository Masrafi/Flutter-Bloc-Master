import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/sign_up/bloc/signup_event.dart';
import 'package:log_registration_bloc/sign_up/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpTextChangeEvent>((event, emit) {
      if (event.fNameValue.length < 1) {
        emit(SignUpErrorState("Enter first name"));
      } else if (event.lNameValue.length < 1) {
        emit(SignUpErrorState("Enter last name"));
      } else if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignUpErrorState("Please enter a valid email"));
      } else if (event.passValue.length <= 7) {
        emit(SignUpErrorState("Enter valid password"));
      } else {
        emit(SignUpValidlState());
      }
    });
    on<SignUpTextSubmitEvent>((event, emit) {
      emit(SignUpLoadingState());
      print(event.fName);
      print(event.lName);
      print(event.email);
      print(event.pass);
    });
  }
}
