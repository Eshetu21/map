import 'package:flutter/material.dart';
import 'package:map/core/home/widgets/bottom_nav_bar_item.dart';
import 'package:map/core/theme/app_pallet.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void updateIndex(int index) {
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: bottomNavColor),
      child: Row(
        children: List.generate(
          _bottomNavigationBarLabels.length,
          (index) => BottomNavBarItem(
            label: _bottomNavigationBarLabels[index],
            icon: _bottomNavigationBarIcons[index],
            isSelected: widget.currentIndex == index,
            onTap: () => updateIndex(index),
          ),
        ),
      ),
    );
  }
}

final List<String> _bottomNavigationBarLabels = [
  "Explore",
  "Search",
  "Contribute",
];

final List<IconData> _bottomNavigationBarIcons = [
  Icons.location_on,
  Icons.search,
  Icons.add_circle_outline,
];

