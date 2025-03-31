import 'package:flutter/material.dart';
import 'package:map/core/const/nearby_places_const.dart';
import 'package:map/features/explore/presentation/widgets/single_nearby_place_widget.dart';

class NearbyPlacesWidget extends StatelessWidget {
  final Function(String) onPlaceClickListner;
  final Function(bool) onComplete;
  const NearbyPlacesWidget({
    super.key,
    required this.onPlaceClickListner,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: NearbyPlacesIconsConst.nearbyPlacesIcons.length,
        itemBuilder: (context, index) {
          IconData singlePlaceIcon =
              NearbyPlacesIconsConst.nearbyPlacesIcons[index];
          String singlePlaceText = NearbyPlacesConst.nearbyPlacesText[index];
          return SingleNearbyPlaceWidget(
            onPlaceClickListner: onPlaceClickListner,
            place: singlePlaceText,
            icon: singlePlaceIcon,
          );
        },
      ),
    );
  }
}

