import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/bloc/weatherEvent.dart';
import 'package:the_wetter/repository/searchRepo.dart';
import 'package:the_wetter/widget/generic/background.dart';

class SearchPage extends StatefulWidget {
  Color color;
  WeatherBloc? weatherBloc;
  String? imgURL;
  SearchPage(this.color, this.weatherBloc, this.imgURL);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TextEditingController cityController = new TextEditingController();
  List cityList = [];
  List test = ['City1', 'City2', 'City3'];
  bool SearchV = true; //Visibility of the search button

  //Animation
  late AnimationController aController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    aController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    animation = Tween<double>(
      //This controls the values of the animation since it is from 0 to 1 by default
      begin: 0,
      end: -230,
    ).animate(aController)
      ..addListener(() {
        setState(
            () {}); //This allows to set the state each time the value changes, the updated value is already in the animation field
      });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Search',
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Background(Colors.black.withOpacity(0.35), widget.imgURL),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(100),
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                          controller: cityController,
                          onChanged: queryCity,
                          autofocus: true,
                          showCursor: true,
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white70,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a city ',
                            hintStyle: TextStyle(
                              fontSize: 32,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          )),
                      ListView.builder(
                          itemCount: cityList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Center(
                                  child: GestureDetector(
                                    onTap: () =>
                                        setCity(cityList[index], index),
                                    child: Text(
                                      cityList[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white.withOpacity(.9),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          }),
                      SizedBox(height: 30),
                      Visibility(
                        visible: SearchV,
                        child: InkWell(
                          onTap: () {
                            if (cityController.text.length != 0) {
                              widget.weatherBloc!.add(FetchData(cityController
                                  .text)); //Send the city to the Bloc
                              Navigator.pop(context);
                              print('Search exit');
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Yikes...',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                  content: Text('C\'mon...Give me a city :(',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      )),
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
                                        onPressed: () =>
                                            Navigator.pop(context)),
                                  ],
                                  backgroundColor: Colors.white,
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                          child: Container(
                            child: Center(
                              child: AutoSizeText(
                                'Search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxFontSize: 26,
                                minFontSize: 22,
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: IconButton(
                      onPressed: (() => Navigator.pop(context)),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30.0,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  queryCity(String city) async {
    //Calling the city repo
    if (city.length != 0) {
      List responseList;
      responseList = await SearchRepoImpl().getList(city);
      responseList.forEach((city) => print(city));
      if (responseList.length == 0) {
        SearchV = true;
      } else {
        SearchV = false;
      }
      setState(() {
        cityList = responseList;
        if (!SearchV) {
          aController.forward();
        } else
          aController.reverse();
      });
    } else {
      setState(() {
        cityList = [];
        aController.reverse();
        SearchV = true;
      });
    }
  }

  setCity(String? city, int index) {
    print(cityList[index]);
    cityController.text = cityList[index];
    widget.weatherBloc!.add(FetchData(cityController
        .text)); //Send the city to the Bloc, this can be added to a function in the future
    Navigator.pop(context);
    print('Search exit');
    queryCity(cityList[index]);
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }
}
