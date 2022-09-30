import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  final String fname, lname, email, pass;
  const ViewData({
    Key? key,
    required this.fname,
    required this.lname,
    required this.email,
    required this.pass,
  }) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Text(
              "First name: ${widget.fname}",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Last name: ${widget.lname}",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Email: ${widget.email}",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Password: ${widget.pass}",
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
