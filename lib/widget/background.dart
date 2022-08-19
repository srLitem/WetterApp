import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  Color back_color;
  String? back_img;
  Background(this.back_color, this.back_img);

  @override
  Widget build(BuildContext context) {
    String animation_name = 'Background Loop';

    return Stack(
      children: <Widget>[
        Container( //Background image
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(back_img!),
          ),
        ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.4),
          ),
        ),
        Container(
          child: FlareActor(
            'assets/animations/background_loop.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: animation_name,
            color: back_color,
          ),
        ),
      ],
    );
  }

}