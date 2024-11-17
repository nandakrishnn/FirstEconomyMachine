import 'package:auto_size_text/auto_size_text.dart';
import 'package:firsteconomy/bottom_nav.dart';

import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/views/loan_info.dart';
import 'package:firsteconomy/widgets/choose_image_avatar.dart';
import 'package:firsteconomy/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: AppColors.mainColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(85),
            child: CustomAppBar(
              subtext: 'Ayush',
            )),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              AppConstants.kheight15,
              const PersonImagePicker(
                imageUrl: 'assets/Group 1000005951.png',
                cameraContainerColor: Colors.white,
              ),
              AppConstants.kheight15,
              const AutoSizeText(
                'Ayush Khurana',
                style: TextStyle(
                    color: AppColors.mainBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              AppConstants.kheight10,
              const AutoSizeText(
                '+91 994021***3',
                style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
              ),
              AppConstants.kheight15,
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (title[index] == 'Loan Info') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoanInfo(), 
                            ),
                          );
                        }
                      },
                      leading: Image.asset(
                        icons[index],
                        height: 30,
                        width: 30,
                      ),
                      title: AutoSizeText(
                        title[index],
                        style: const TextStyle(color: AppColors.pureWhite),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
               
      ),
    );
  }
}

List<String> icons = [
  'assets/person.png',
  'assets/searchru.png',
  'assets/paisa.png',
  'assets/bikeinfo.png',
  'assets/vechiledoc.png',
  'assets/register.png',
  'assets/logout.png'
];
List<String> title = [
  'Profile',
  'Loan Info',
  'Repayment',
  'Bike Info',
  'Vehicle Documents',
  'Register Mandate',
  'Logout'
];
