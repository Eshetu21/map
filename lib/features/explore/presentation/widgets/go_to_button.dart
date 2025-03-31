import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          margin: EdgeInsets.only(left: 15, right: 15, top: 20,bottom: 10),
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

