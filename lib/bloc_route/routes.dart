import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_registration_bloc/http_post/bloc/app_bloc.dart';
import 'package:log_registration_bloc/sign_up/bloc/signup_bloc.dart';
import 'package:log_registration_bloc/sign_up/screen/signup_screen.dart';
import 'package:log_registration_bloc/sign_up/screen/view_data.dart';
import 'package:log_registration_bloc/welcome_screen.dart';
import '../data_get_api/repository/repository.dart';
import '../data_get_api/screen/api_home_screen.dart';
import '../data_get_api/screen/view_data.dart';
import '../http_post/repo/product_repo.dart';
import '../http_post/screen/datafield_check.dart';
import '../internet/bloc_cubit/internet_cubit.dart';
import '../internet/screen/internet_home.dart';
import '../sign_in/bloc/signin_bloc.dart';
import '../sign_in/screen/signin_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/welcome":
        return MaterialPageRoute(
          builder: (context) => Welcome(),
        );

      case "/signin":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignInBloc(),
            child: SigninScreen(),
          ),
        );

      case "/internet":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InternetCubit(),
            child: InternetHome(
              email: arguments["title"],
              pass: arguments["pass"],
            ),
          ),
        );

      case "/signup":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpBloc(),
            child: SignUpScreen(),
          ),
        );

      case "/viewdata":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ViewData(
            fname: arguments["fname"],
            lname: arguments["lname"],
            email: arguments["email"],
            pass: arguments["pass"],
          ),
        );

      case "/apihome":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => Repository(),
            child: ApiHomeScreen(),
          ),
        );

      case "/viewdataAPI":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ViewDataAPI(
            model: arguments['model'],
          ),
        );

      case "/httppost":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => ProductRepository(),
            child: HttpCheck(),
          ),
        );

      // case "/calldata":
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => ProductBloc(productRepository: ),
      //       child: SignUpScreen(),
      //     ),
      //   );

      default:
        return null;
    }
  }
}
