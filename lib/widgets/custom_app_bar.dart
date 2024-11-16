import 'package:firsteconomy/animations/route_animations.dart';
import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/views/profile_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
 final String?subtext;
  const CustomAppBar({
    this.subtext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color:AppColors.lightGreyColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color:const Color.fromARGB(58, 39, 37, 37).withOpacity(0.05),
            offset: const Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
          padding:  const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(createRoute(const  ProfilePage()));
                    },
                    child: Image.asset(
                      'assets/Group 1000005951.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  AppConstants.kwidth10,
                  Column(
                 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         AppConstants.kheight20,
                      const Text(
                        'Hi,',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                        Text(
                        subtext??'',
                        style: const TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.kwidth5,
              Image.asset(
                'assets/appbarimage.png',
              ),
                 AppConstants.kwidth20,
              const Icon(
                Icons.menu,
                size: 28,
                color: AppColors.pureWhite,
              )
            ],
          )),
    );
  }
}
