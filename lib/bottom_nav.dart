import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/views/home_page.dart';
import 'package:firsteconomy/views/profile_page.dart'; // Import ProfilePage
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // The selected index for the bottom navigation
  int _selectedIndex = 0;

 
  final List<Widget> _pages = [
    const HomePage(),

    Container(), 
    Container(),
  ];

  // This function will handle bottom navigation tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: _pages[0], // Always show HomePage (even when on ProfilePage)
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.bottomNavColor,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex, 
            onTap: _onItemTapped, 
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_membership_outlined,
                  size: 30,
                ),
                label: 'Nitro Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.award,
                  size: 30,
                ),
                label: 'Rewards',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
