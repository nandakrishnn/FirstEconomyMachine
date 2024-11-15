import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: HomePage(), // Display the current screen
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(14),topRight: Radius.circular(14)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, 
          backgroundColor: AppColors.bottomNavColor,
     
      
 
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_outlined),
              label: 'Nitro Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.award),
              label: 'Rewards',
            ),
          ],
        ),
      ),
    );
  }
}
