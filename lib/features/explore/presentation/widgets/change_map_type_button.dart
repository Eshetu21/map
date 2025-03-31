import 'package:flutter/material.dart';
import 'package:map/core/theme/app_pallet.dart';

class ChangeMapTypeButton extends StatelessWidget {
  final VoidCallback onTap;
  const ChangeMapTypeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 5.0,
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Icon(Icons.layers_outlined, size: 28, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

