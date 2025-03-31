import 'package:flutter/material.dart';
import 'package:map/core/home/widgets/bottom_nav_bar.dart';
import 'package:map/features/contribute/presentation/pages/contribute_page.dart';
import 'package:map/features/explore/presentation/pages/explore_page.dart';
import 'package:map/features/save/presentation/pages/saved_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _pages = [ExplorePage(), SavedPage(), ContributePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(index: currentIndex, children: _pages),
    );
  }
}

