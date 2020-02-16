import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/repository/weatherRepo.dart';
import 'package:the_wetter/widget/structure.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherRepoImpl()),
      child: MaterialApp(
        title: 'Wetter',
        theme: ThemeData(
          fontFamily: 'Inconsolata',
        ),
        home: Structure(),
      ),
    );
  }
  }
