import 'package:bloc/bloc.dart';
import 'package:the_wetter/bloc/weatherEvent.dart';
import 'package:the_wetter/bloc/weatherState.dart';
import 'package:the_wetter/model/weatherModel.dart';
import 'package:the_wetter/repository/weatherRepo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  late WeatherRepo repo;
  WeatherModel? weatherInfo;

  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchData>(((event, emit) async {
      await fetchData(event, emit);
    }));
  }

  Future<void> fetchData(FetchData event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      print('Loading data with:');
      print(event.city);
      final weatherInfo = await repo.getData(event.city);
      print('Data loaded');
      emit(WeatherShowState(weatherInfo));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}


  
/*
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchData) {
      try {
        yield WeatherLoadingState();
        print('Loading data with:');
        print(event.city);
        final weatherInfo = await repo.getData(event.city);
        print('Data loaded');
        yield WeatherShowState(weatherInfo);
      } catch (e) {
        yield WeatherErrorState(e.toString());
      }
    } else {
      yield WeatherToSearchState();
    }
  }*/

