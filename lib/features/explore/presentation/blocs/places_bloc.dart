import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/core/services/nearby_places.dart';
import 'package:map/features/explore/data/models/gas_station_model.dart';

/// STATES
abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final List<GasStation> gasStations;
  PlacesLoaded({required this.gasStations});
}

class PlacesError extends PlacesState {
  final String message;
  PlacesError(this.message);
}

abstract class PlacesEvent {}

class FetchNearbyGasStations extends PlacesEvent {
  final LatLng position;
  FetchNearbyGasStations(this.position);
}

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesService _placesService;

  PlacesBloc(this._placesService) : super(PlacesInitial()) {
    on<FetchNearbyGasStations>((event, emit) async {
      emit(PlacesLoading());
      try {
        final results = await _placesService.getNearbyGasStations(event.position);

        final gasStations = results
            .map((json) {
              try {
                return GasStation.fromJson(json);
              } catch (_) {
                return null;
              }
            })
            .whereType<GasStation>()
            .toList();

        emit(PlacesLoaded(gasStations: gasStations));
      } catch (e) {
        emit(PlacesError(e.toString()));
      }
    });
  }
}

