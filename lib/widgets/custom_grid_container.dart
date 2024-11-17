import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:flutter/material.dart';

class CustomContainerGrid extends StatelessWidget {
  final String imageUrl;
  final String text1;
  final String? text2;
  final LinearGradient gradient;
  final LinearGradient gradient2;

  const CustomContainerGrid({
    required this.imageUrl,
    required this.text1,
     this.text2,
    required this.gradient,
    required this.gradient2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: .8,
          color: Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
         gradient: gradient2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            AppConstants.kheight10,
            Text(
              text1,
              style:const TextStyle(color: AppColors.whiteColor, fontSize: 9),
            ),
            Text(
              text2??'',
              style:const TextStyle(color: AppColors.whiteColor, fontSize: 9),
            )
          ],
        ),
      ),
    );
  }

}

   