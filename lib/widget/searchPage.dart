import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/bloc/weatherEvent.dart';
import 'package:the_wetter/model/weatherModel.dart';
import 'package:the_wetter/widget/background.dart';

class SearchPage extends StatelessWidget{
  Color color;
  TextEditingController cityController = new TextEditingController();
  WeatherBloc weatherBloc;
  String imgURL;
  SearchPage(this.color, this.weatherBloc, this.imgURL);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Hero(
      tag: 'Search',
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Background(Colors.black.withOpacity(0.35), imgURL),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150,
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                          controller: cityController,
                          autofocus: false,
                          showCursor: true,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white70,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a city :)',
                            hintStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          )
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: (){
                          if(cityController.text.length != 0) {
                            weatherBloc.add(FetchData(cityController.text)); //Send the city to the Bloc
                            Navigator.pop(context);
                            print('Search exit');
                          }else{
                            showDialog(
                                context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                    'Oops...',
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
                                content: Text(
                                    'C\'mon! Give me a city :(',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                        'Oh, sure!',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                    ),
                                  onPressed: () => Navigator.pop(context)
                                  ),
                                ],
                                backgroundColor: Colors.white,
                              ),
                              barrierDismissible: false,
                            );
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Search',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 27,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                          ),
                          height: 50,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}