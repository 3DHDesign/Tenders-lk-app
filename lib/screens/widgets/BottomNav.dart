import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tenders_lk_app/screens/favorites/FavoriteScreen.dart';
import 'package:tenders_lk_app/screens/home/HomeScreen.dart';
import 'package:tenders_lk_app/screens/tenders/TendersScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int getCurrentIndex = 0;

  List pages = [
    HomeScreen(),
    FavoriteScreen(),
    TendersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25,
          )
        ]),
        child: BottomNavigationBar(
            selectedFontSize: 15,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade400,
            selectedItemColor: Colors.orange.shade900,
            currentIndex: getCurrentIndex,
            onTap: (index) {
              setState(() {
                getCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.bookmark), label: 'Bookmark'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.calculator), label: 'Tenders'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.personalcard), label: 'Profile'),
            ]),
      ),
      body: pages[getCurrentIndex],
    );
  }
}
