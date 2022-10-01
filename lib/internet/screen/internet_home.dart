import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_cubit/internet_cubit.dart';

class InternetHome extends StatefulWidget {
  final String email, pass;
  const InternetHome({Key? key, required this.email, required this.pass})
      : super(key: key);

  @override
  State<InternetHome> createState() => _InternetHomeState();
}

class _InternetHomeState extends State<InternetHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              widget.email,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              widget.pass,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state == InternetState.Gained) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet connected'),
                    ),
                  );
                } else if (state == InternetState.Lost) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet not connected'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == InternetState.Gained) {
                  return Text('Connected');
                } else if (state == InternetState.Lost) {
                  return Text('Not connected');
                } else {
                  return Text('Loading…');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
