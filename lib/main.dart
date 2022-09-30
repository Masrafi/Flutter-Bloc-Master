import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/bloc_route/routes.dart';
import 'package:log_registration_bloc/internet/bloc/internet_cubit.dart';
import 'package:log_registration_bloc/sign_in/screen/signin_screen.dart';

import 'internet/screen/internet_home.dart';
import 'sign_in/bloc/signin_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Loader',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: '/welcome',
      // home: MultiBlocProvider(
      //   providers: [
      //     BlocProvider<InternetCubit>(
      //       create: (BuildContext context) => InternetCubit(),
      //     ),
      //     BlocProvider<SignInBloc>(
      //       create: (BuildContext context) => SignInBloc(),
      //     ),
      //     // BlocProvider<BlocC>(
      //     //   create: (BuildContext context) => BlocC(),
      //     // ),
      //   ],
      //   child: SigninScreen(),
      // )
      // BlocProvider(
      //   create: (context) => SignInBloc(),
      //   child: SigninScreen(),
      // ),
    );
  }
}
