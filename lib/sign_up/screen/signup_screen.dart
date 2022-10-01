import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/sign_up/bloc/signup_event.dart';
import 'package:log_registration_bloc/sign_up/bloc/signup_state.dart';

import '../bloc/signup_bloc.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is masrafi'),
      ),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                if (state is SignUpErrorState) ...[
                  Text(
                    state.errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ] else ...[
                  Container()
                ],
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: fNameController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                      SignUpTextChangeEvent(
                        fNameController.text,
                        lNameController.text,
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  decoration: InputDecoration(hintText: 'First Namr'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lNameController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                      SignUpTextChangeEvent(
                        fNameController.text,
                        lNameController.text,
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  decoration: InputDecoration(hintText: 'last Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                      SignUpTextChangeEvent(
                        fNameController.text,
                        lNameController.text,
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  decoration: InputDecoration(hintText: 'Emain Address'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  onChanged: (val) {
                    BlocProvider.of<SignUpBloc>(context).add(
                      SignUpTextChangeEvent(
                        fNameController.text,
                        lNameController.text,
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  child: Text("Sign In"),
                  onPressed: () {
                    if (state is SignUpValideState) {
                      BlocProvider.of<SignUpBloc>(context).add(
                        SignUpTextSubmitEvent(
                          fNameController.text,
                          lNameController.text,
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        '/viewdata',
                        arguments: {
                          "fname": fNameController.text,
                          "lname": lNameController.text,
                          "email": emailController.text,
                          "pass": passwordController.text,
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('TextField is empty'),
                        ),
                      );
                    }
                  },
                  color:
                      (state is SignUpValideState) ? Colors.blue : Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
