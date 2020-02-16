import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget{

  String message;

  ErrorPage(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(message)
        ),
      ),
    );
  }

}