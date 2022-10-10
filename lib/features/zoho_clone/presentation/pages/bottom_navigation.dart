import 'package:flutter/material.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/checkin_checkout.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/history.dart';

class BottomNav extends StatefulWidget {
  BottomNav({
    Key? key,
  }) : super(key: key);
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 1;
  final tabs = [
    CheckInCheckOut(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: kGreen,
        backgroundColor: kBlack,
        unselectedItemColor: kLightestGrey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: kBlack,
            icon: Icon(Icons.abc),
            label: "Check-In/Out",
          ),
          BottomNavigationBarItem(
            backgroundColor: kBlack,
            icon: Icon(Icons.abc),
            label: "History",
          ),
        ],
      ),
      body: tabs[currentIndex],
    );
  }
}
