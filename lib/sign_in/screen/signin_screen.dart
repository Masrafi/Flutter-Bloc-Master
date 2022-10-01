import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/sign_in/bloc/signin_bloc.dart';
import 'package:log_registration_bloc/sign_in/bloc/signin_event.dart';
import 'package:log_registration_bloc/sign_in/bloc/signin_state.dart';

class SigninScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is masrafi'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(hintText: 'Emain Address'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CupertinoButton(
                    child: Text("Sign In"),
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                        Navigator.pushNamed(context, '/internet', arguments: {
                          "title": emailController.text,
                          "pass": passwordController.text
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('TextField is empty'),
                          ),
                        );
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
