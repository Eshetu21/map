import 'package:get_it/get_it.dart';
import 'package:map/features/geolocation/geolocation_bloc.dart';

final GetIt sl = GetIt.instance;

void setUpDependencies() {
  sl.registerLazySingleton(() => GeolocationBloc());
}

