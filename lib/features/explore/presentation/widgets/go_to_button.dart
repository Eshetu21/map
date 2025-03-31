import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/core/theme/app_pallet.dart';

class GoToButton extends StatelessWidget {
  final VoidCallback onTap;

  const GoToButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: primaryColorLight,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: primaryColorLight!,
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Icon(FontAwesomeIcons.diamondTurnRight, color: whiteColor),
          ),
        ),
      ),
    );
  }
}

extension AnimatedMapController on MapController {
  void animatedMove(
    LatLng destLocation,
    double targetZoom,
    {required TickerProvider vsync, 
    dynamic mapState, 
    Duration duration = const Duration(milliseconds: 800)}) {

    final currentCenter = mapState != null
        ? LatLng(mapState.latitude, mapState.longitude)
        : destLocation;

    final currentZoom = mapState?.zoom ?? targetZoom;

    final latTween = Tween<double>(begin: currentCenter.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(begin: currentCenter.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: currentZoom, end: targetZoom);

    final controller = AnimationController(vsync: vsync, duration: duration);
    final animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}

