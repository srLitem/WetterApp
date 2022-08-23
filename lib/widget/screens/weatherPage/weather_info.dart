import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  var temperature;
  var forecast;
  var precip;
  var summary;
  var iconito;

  WeatherInfo(
      this.temperature, this.summary, this.forecast, this.precip, this.iconito);

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
        Stack(
          //Container of the weather information
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.4),
              ),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            Column(
              children: <Widget>[
                AutoSizeText(
                  temperature.round().toString() + '°',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.9),
                  ),
                  minFontSize: 70,
                  stepGranularity: 10,
                  maxFontSize: 80,
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                AutoSizeText(
                  day(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.9),
                  ),
                  minFontSize: 20,
                  stepGranularity: 2,
                  maxFontSize: 24,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: AutoSizeText(
                    forecast,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(.9),
                    ),
                    minFontSize: 22,
                    stepGranularity: 2,
                    maxFontSize: 26,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: AutoSizeText(
                    'There is a ' +
                        precip.round().toString() +
                        '% chance of rain',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(.9),
                    ),
                    minFontSize: 20,
                    maxFontSize: 24,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String day() {
    late String result;
    switch (DateTime.now().weekday) {
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

    return result +
        ' ' +
        DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString();
  }
}
