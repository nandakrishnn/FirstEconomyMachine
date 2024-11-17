import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/widgets/custom_app_bar.dart';
import 'package:firsteconomy/widgets/dots_around_slider.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LoanInfo extends StatelessWidget {
  const LoanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(85),
            child: CustomAppBar(
              subtext: 'Ayush',
            )),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Number of ',
                    style: TextStyle(
                        color: AppColors.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                TextSpan(
                    text: 'EMIs',
                    style: TextStyle(
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ])),
              AppConstants.kheight30,
              const Text(
                '60',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkGreen,
                ),
              ),
              AppConstants.kheight20,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        size: 230,
                        startAngle: 130,
                        angleRange: 280,
                        customWidths: CustomSliderWidths(
                          trackWidth: 50,
                          progressBarWidth: 20,
                          handlerSize: 25,
                        ),
                        customColors: CustomSliderColors(
                          trackColor: Colors.grey.shade800,
                          progressBarColor: AppColors.darkGreen,
                          dotColor: Colors.white,
                        ),
                      ),
                      min: 0,
                      max: 100,
                      initialValue: 0,
                      onChange: (double value) {},
                      innerWidget: (double value) {
                        final int emiValue = value.toInt();
                        return Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 145,
                                height: 145,
                                child: CustomPaint(
                                  painter: DashedCircularBorderPainter(
                                    color: AppColors.pureWhite,
                                    thickness: 7,
                                    dashCounter: 60,
                                    startAngle: 130,
                                    angleRange: 280,
                                    gapRatio: 0.6,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: AppColors.darkGreen,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  emiValue.toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.pureWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.36,
                    bottom: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_up,
                            color: AppColors.darkGreen,
                            size: 25,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: AppColors.darkGreen,
                            thickness: 2,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.darkGreen,
                            size: 25,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.13,
                    child: const Text(
                      '30',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.13,
                    child: const Text(
                      '90',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
