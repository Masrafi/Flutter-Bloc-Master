import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_registration_bloc/bloc_route/routes.dart';

import 'gmailLogin/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: '/welcome',
      //home: AuthService().handleAuthState(),
    );
  }
}
