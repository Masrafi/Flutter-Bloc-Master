import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 300.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signin");
              },
              child: const Text(
                "Sign In",
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
              child: const Text(
                "Sign Up",
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
