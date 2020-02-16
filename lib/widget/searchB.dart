import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchB extends StatelessWidget{
  double size;

  SearchB(this.size);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Icon(
          FontAwesomeIcons.search,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }

}