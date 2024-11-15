import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      decoration: BoxDecoration(
        color: Color.fromARGB(30, 255, 255, 255),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(58, 39, 37, 37).withOpacity(0.05),
            offset: const Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/Group 1000005951.png',
                    height: 50,
                    width: 50,
                  ),
                  AppConstants.kwidth10,
                  const Text(
                    'Hi,',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              AppConstants.kwidth10,
              Image.asset(
                'assets/appbarimage.png',
              ),
                 AppConstants.kwidth20,
              const Icon(
                Icons.menu,
                size: 32,
                color: AppColors.whiteColor,
              )
            ],
          )),
    );
  }
}
