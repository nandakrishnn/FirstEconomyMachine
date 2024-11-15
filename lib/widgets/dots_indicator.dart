import 'package:dots_indicator/dots_indicator.dart';
import 'package:firsteconomy/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndicator extends StatefulWidget {
  const CustomDotIndicator({super.key});

  @override
  State<CustomDotIndicator> createState() => _CustomDotIndicatorState();
}

class _CustomDotIndicatorState extends State<CustomDotIndicator> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _currentIndex,
      onTap: (position) {
        setState(() => _currentIndex = position);
      },
      decorator: DotsDecorator(
        spacing:const EdgeInsets.all(3),
        size: const Size.square(6.0),
        activeSize: const Size(33.0, 7.0),
        activeColor: AppColors.mainBlueColor,
        color: AppColors.whiteColor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
