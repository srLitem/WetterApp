import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WetterLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String animationName = 'Untitled';
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container( //Background imag// e
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage('assets/img/loadingBack.jpg'),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.4),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: FlareActor(
              'assets/animations/background_loop.flr',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              animation: 'Background Loop',
              color: Colors.black.withOpacity(0.20),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/animations/Ripple.gif')
                  ),
                  SizedBox(height: 10),
                  Text(
                    'THE WETTER',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}