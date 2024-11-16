import 'package:flutter/material.dart';

class PersonImagePicker extends StatelessWidget {
  final String imageUrl;
  final Color cameraContainerColor;

  const PersonImagePicker({
    super.key,
    required this.imageUrl,
    required this.cameraContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(imageUrl),
        ),
        Positioned(
          bottom: 13,
          right: -3,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: cameraContainerColor,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(
                  'assets/camera.png',
                ),
              ),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
