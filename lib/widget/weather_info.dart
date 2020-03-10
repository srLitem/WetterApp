import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget{
  var temperature;
  var forecast;
  var precip;
  var summary;
  var iconito;

  WeatherInfo(this.temperature, this.summary, this.forecast,this.precip, this.iconito);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       Container(
        child: Image.asset(
              'assets/icons/$iconito.png',
              scale: 3.5,
              color: Colors.white,
        ),
       ),
        SizedBox(height: 30),
        Text(
          summary,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Stack( //Container of the weather information
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.4),
              ),
              height: 300,
              width: 400,
            ),
            Column(
              children: <Widget>[
                Text(
                  temperature.round().toString() + '°',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  day(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    forecast,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(.9),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Text(
                    'There is a ' + precip.round().toString() + '% chance of rain',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(.9),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String day(){
    String result;
    switch(DateTime.now().weekday){
      case 1:
        result = 'Monday';
        break;
      case 2:
        result = 'Tuesday';
        break;
      case 3:
        result = 'Wednesday';
        break;
      case 4:
        result = 'Thursday';
        break;
      case 5:
        result = 'Friday';
        break;
      case 6:
        result = 'Saturday';
        break;
      case 7:
        result = 'Sunday';
        break;
    }

    return result + ' ' + DateTime.now().hour.toString() + ':' + DateTime.now().minute.toString();
  }
}