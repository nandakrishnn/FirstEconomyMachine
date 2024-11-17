import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/widgets/footer_icons_page.dart';
import 'package:flutter/material.dart';

class FooterContainer extends StatelessWidget {
  final String imageUrl;
  const FooterContainer({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .38,
      width: MediaQuery.of(context).size.width,
      // color: AppColors.lighestGreyColor,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                          color:  Color.fromRGBO(255, 255, 255, 0.118),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: MediaQuery.of(context).size.height * .12,
              ),
              Positioned(
                top: -15,
                left: 110,
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Container(
            color:AppColors.lighestGreyColor,
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      ImageTextContainer(
                        size: AppConstants.kheight1,
                        imgurl: 'assets/magbike.png',
                        text: 'Browse your\npreferred\ntwo wheelers',
                      ),
                      AppConstants.kwidth8,
                      SizedBox(
                        height: 110,
                        child: VerticalDivider(
                          color: AppColors.whiteColor,
                          thickness: .5,
                        ),
                      ),
                      AppConstants.kwidth8,
                      ImageTextContainer(
                       
                        imgurl: 'assets/sansearch.png',
                        text: 'Create Custom\nLoan Plans\n ',
                      ),
                      AppConstants.kwidth8,
                      SizedBox(
                        height: 110,
                        child: VerticalDivider(
                          color: AppColors.whiteColor,
                          thickness: .5,
                        ),
                      ),
                      AppConstants.kwidth8,
                      ImageTextContainer(
                        imgurl: 'assets/timercloc.png',
                        text: 'Quick Online\nApproval\n',
                      ),
                    ],
                  ),
                  AppConstants.kheight20,
                   Container(
                  height: 40,
                  width: 185,
                  decoration: BoxDecoration(
                      color: AppColors.mainBlueColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Apply Now',
                    style: TextStyle(
                        color: AppColors.pureWhite, fontSize: 12,fontWeight: FontWeight.bold),
                  )),
                )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

