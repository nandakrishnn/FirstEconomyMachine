import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoanInfo extends StatelessWidget {
  const LoanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
         appBar:  PreferredSize(
              preferredSize: Size.fromHeight(85),
              child: CustomAppBar(
                subtext: 'Ayush',
              )),
              body: Column(
                children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Number of',style: TextStyle(color: AppColors.darkGreen,fontWeight:FontWeight.bold,fontSize: 16)),
                     TextSpan(text: 'EMIs',style: TextStyle(color: AppColors.orangeColor,fontWeight:FontWeight.bold,fontSize: 16))
                  ]
                )
              )
                ],
              ),
      ),
    );
  }
}