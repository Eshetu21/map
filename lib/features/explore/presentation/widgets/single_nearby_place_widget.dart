import 'package:flutter/material.dart';
import 'package:map/core/theme/app_pallet.dart';

class SingleNearbyPlaceWidget extends StatelessWidget {
  final Function(String) onPlaceClickListner;
  final String place;
  final IconData icon;
  const SingleNearbyPlaceWidget({
    super.key,
    required this.onPlaceClickListner,
    required this.place,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPlaceClickListner(place);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 5, bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 5.0,
              spreadRadius: 0.5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.black87),
            SizedBox(width: 6),
            Text(
              place,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

