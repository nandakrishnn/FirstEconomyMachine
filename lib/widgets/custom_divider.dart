import 'package:firsteconomy/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.whiteColor,
      indent: 13,
      endIndent: 13,
      thickness: .6,
    );
  }
}