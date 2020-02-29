import 'package:flutter/material.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/model/weatherModel.dart';
import 'package:the_wetter/widget/searchB.dart';
import 'package:the_wetter/widget/searchPage.dart';

class TopBar extends StatefulWidget{

  String city;
  String imgURL;
  WeatherBloc weatherBloc;

  TopBar(this.city, this.weatherBloc, this.imgURL);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Topbar();
  }

}

class _Topbar extends State<TopBar>{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Hero(
      tag: 'Search',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
              child: InkWell(
                onTap: (){
                  print('Search tapped');
                  Navigator.push(context, MaterialPageRoute( //Redirect to the SearchPage
                    builder: (context){
                      return SearchPage(Colors.black.withOpacity(0.35), widget.weatherBloc, widget.imgURL);
                    }
                  ));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      height: 50,
                      width: 400,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SearchB(17.0),
                        SizedBox(width: 5,),
                        Text(
                          widget.city, //Name of the city
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Sans',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}