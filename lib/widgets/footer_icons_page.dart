import 'package:firsteconomy/constants/colors.dart';
import 'package:flutter/material.dart';

class ImageTextContainer extends StatelessWidget {
  final String imgurl;
  final String text;
  final SizedBox size; // The SizedBox will default to height 10 if not provided.

  const ImageTextContainer({
    this.size = const SizedBox(height: 10), // Default SizedBox with height 10
    required this.imgurl,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imgurl),
        size, // Using the passed SizedBox
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.pureWhite, fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
