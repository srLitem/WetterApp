import 'package:bloc/bloc.dart';
import 'package:the_wetter/bloc/weatherEvent.dart';
import 'package:the_wetter/bloc/weatherState.dart';
import 'package:the_wetter/model/weatherModel.dart';
import 'package:the_wetter/repository/weatherRepo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherRepo repo;
  WeatherModel weatherInfo;
  WeatherBloc(this.repo);

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchData){
      try{
        yield WeatherLoadingState();
        print('Loading data with:');
        print(event.city);
        final weatherInfo = await repo.getData(event.city);
        print('Data loaded');
        yield WeatherShowState(weatherInfo);

      }catch(e){
        yield WeatherErrorState(e.toString());
      }
    }else {
      yield WeatherToSearchState();
    }
  }

}