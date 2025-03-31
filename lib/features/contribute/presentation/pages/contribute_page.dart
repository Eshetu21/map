import 'package:flutter/material.dart';
import 'package:map/core/global/widgets/search_widget.dart';
import 'package:map/core/theme/app_pallet.dart';
import 'package:map/features/save/presentation/widgets/save_bottom_item.dart';

class ContributePage extends StatefulWidget {
  const ContributePage({super.key});

  @override
  State<ContributePage> createState() => _ContributePageState();
}

class _ContributePageState extends State<ContributePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(controller: _searchController),
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "View your profile",
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SaveBottomItem(icon: Icons.edit, title: "Edit map"),
                        SaveBottomItem(
                          icon: Icons.add_location_alt_outlined,
                          title: "Add place",
                        ),
                        SaveBottomItem(
                          icon: Icons.rate_review_outlined,
                          title: "Write review",
                        ),
                        SaveBottomItem(
                          icon: Icons.add_a_photo_outlined,
                          title: "Add photo",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: greyColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 210,
                            height: 210,
                            child: Image.asset(
                              "assets/images/aircraft_balloon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Keep going", style: TextStyle(fontSize: 20)),
                          SizedBox(height: 5),
                          Text(
                            "There are many ways to contribute on Google Maps. Try something new as you go for the next level",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Contribute now",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

