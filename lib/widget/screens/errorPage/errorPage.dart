import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_wetter/widget/structure.dart';

class ErrorPage extends StatelessWidget {
  String message;

  ErrorPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/img/cat.gif',
                scale: 3,
              ),
            ),
            Text(
              'Oh no! What have you done?!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            AutoSizeText(
              'We are working on this ;). Please, go back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              minFontSize: 20,
              maxFontSize: 24,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Structure())),
              child: AutoSizeText(
                "Ok, I will",
                minFontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
