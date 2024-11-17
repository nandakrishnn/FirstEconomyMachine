import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:flutter/material.dart';

class InviteContainer extends StatelessWidget {
  final String inviteHeaderl;
  final String inviteSubtext;
  final String buttonText;
  final String imageurl;
  const InviteContainer({
    required this.buttonText,
    required this.imageurl,
    required this.inviteHeaderl,
    required this.inviteSubtext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .19,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inviteHeaderl,
                  style: const TextStyle(
                      color: AppColors.mainBlueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                AppConstants.kheight10,
                Text(
                  inviteSubtext,
                  style:
                      const TextStyle(color: AppColors.pureWhite, fontSize: 7),
                ),
                AppConstants.kheight15,
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: AppColors.mainBlueColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    buttonText,
                    style: const TextStyle(
                        color: AppColors.whiteColor, fontSize: 11),
                  )),
                )
              ],
            ),
            const Spacer(),
            Image.asset(imageurl),
          ],
        ),
      ),
    );
  }
}