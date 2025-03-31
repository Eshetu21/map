import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/core/global/widgets/search_widget.dart';
import 'package:map/features/explore/presentation/widgets/change_map_type_button.dart';
import 'package:map/features/explore/presentation/widgets/go_to_button.dart';
import 'package:map/features/explore/presentation/widgets/map_type_selector.dart';
import 'package:map/features/explore/presentation/widgets/nearby_places_widget.dart';
import 'package:map/features/explore/presentation/widgets/track_location_button.dart';
import 'package:map/features/geolocation/geolocation_bloc.dart';
import 'package:map/features/search/presentation/search_page.dart';
import 'package:permission_handler/permission_handler.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final MapController mapController = MapController();
  FocusScopeNode focusNode = FocusScopeNode();

  String _mapTypeUrl =
      'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}.png?key=MHrVVdsKyXBzKmc1z9Oo';

  double getZoomLevel(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return 14.5;
    if (width > 800) return 14.0;
    return 4;
  }

  Future<void> _checkLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.request();

    if (status.isGranted) {
      if (!mounted) return;
      context.read<GeolocationBloc>().add(FetchUserLocation());
    } else if (status.isDenied) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Location permission is required to access your location",
          ),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _showMapTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return MapTypeSelector(
          selectedMapUrl: _mapTypeUrl,
          onMapTypeSelected: (String selectedUrl) {
            setState(() {
              _mapTypeUrl = selectedUrl;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double zoomLevel = getZoomLevel(context);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              maxZoom: 18,
              minZoom: zoomLevel,
              initialCenter: LatLng(9.03, 38.74),
              initialZoom: zoomLevel,
            ),
            children: [
              TileLayer(urlTemplate: _mapTypeUrl),
              BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
                  if (state is GeolocationLoaded) {
                    return MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(state.latitude, state.longitude),
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.purple,
                            size: 30,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                controller: _searchController,
                isShowCancel: false,
                loading: false,
                readOnly: true,
                onCancelTap: () {},
                focusScopeNode: focusNode,
                onTapOutside: (event) {
                  focusNode.unfocus();
                },
                onTap: () {
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                const SearchPage(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 150),
                      ),
                    );
                  });
                },
              ),
              NearbyPlacesWidget(
                onPlaceClickListner: (nearbyPlaces) {},
                onComplete: (value) {},
              ),
              ChangeMapTypeButton(
                onTap: () {
                  _showMapTypeBottomSheet(context);
                },
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TrackLocationButton(
                    onTap: ()  {
                      final geolocationState =
                           context.read<GeolocationBloc>().state;
                      if (geolocationState is GeolocationLoaded) {
                        final dest = LatLng(
                          geolocationState.latitude,
                          geolocationState.longitude,
                        );
                        mapController.animatedMove(
                          dest,
                          15.0,
                          vsync: this,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Location not avaliable")),
                        );
                      }
                    },
                  ),
                  GoToButton(onTap: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

