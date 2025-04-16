import 'package:get_it/get_it.dart';
import 'package:map/core/services/nearby_places.dart';
import 'package:map/features/explore/presentation/blocs/places_bloc.dart';
import 'package:map/features/geolocation/geolocation_bloc.dart';

final GetIt sl = GetIt.instance;
final PlacesService placesService = PlacesService();
void setUpDependencies() {
  sl.registerLazySingleton(() => GeolocationBloc());
  sl.registerLazySingleton(() => PlacesBloc(placesService));
}

