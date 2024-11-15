import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/services/api_helper.dart';
import 'package:firsteconomy/widgets/custom_grid_container.dart';
import 'package:firsteconomy/widgets/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(85), child: CustomAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: ApiServices().getBannerImages(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      final bannerImages = snapshot.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * .20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerImages?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .22,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              bannerImages![index].bannerImage,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                const CustomDotIndicator(),
                AppConstants.kheight5,
                const Divider(
                  color: AppColors.whiteColor,
                  indent: 13,
                  endIndent: 13,
                  thickness: .6,
                ),
                AppConstants.kheight5,
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Services',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                AppConstants.kheight10,
                SizedBox(
                  height: MediaQuery.of(context).size.height * .27,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 15,
                              mainAxisExtent: 90,
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return CustomContainerGrid(
                            imageUrl: gridImages[index],
                            text1: gridText1[index],
                            text2: gridText2[index],
                            gradient: index % 2 == 1
                                ? const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 165, 158, 158),
                                      Colors.black
                                    ],
                                  )
                                : const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(255, 165, 158, 158),
                                    ],
                                  ),
                            gradient2: index % 2 == 1
                                ? const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 30, 29, 29),
                                      Color.fromARGB(255, 13, 13, 13),
                                    ],
                                  )
                                : const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 13, 13, 13),
                                      Color.fromARGB(255, 30, 29, 29),
                                    ],
                                  ));
                      }),
                ),
                AppConstants.kheight10,
                const Divider(
                  color: AppColors.whiteColor,
                  indent: 13,
                  endIndent: 13,
                  thickness: .6,
                ),
                AppConstants.kheight10,
                Container(
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
                            const Text(
                              'Invite your friends',
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            AppConstants.kheight10,
                            const Text(
                              'Get upto 10000 coins when you friends sign up for\nCWC app',
                              style: TextStyle(
                                  color: AppColors.whiteColor, fontSize: 7),
                            ),
                            AppConstants.kheight15,
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: AppColors.mainBlueColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Center(
                                  child: Text(
                                'Send Invite',
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 10),
                              )),
                            )
                          ],
                        ),
                        const Spacer(),
                        Image.asset('assets/welcome.png'),
                      ],
                    ),
                  ),
                ),
                AppConstants.kheight20,
                const Divider(
                  color: AppColors.whiteColor,
                  indent: 13,
                  endIndent: 13,
                  thickness: .6,
                ),
                AppConstants.kheight30,
                Container(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.mainColor,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: MediaQuery.of(context).size.height * .12,
                      ),
                      Positioned(
                        top: -15,
                        left: 110,
                        child: Center(
                          child: Image.asset(
                            'assets/mainbike.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> gridImages = [
  'assets/Group 34504.png',
  'assets/loanhand.png',
  'assets/emi.png',
  'assets/credit.png',
  'assets/bike serviving.png',
  'assets/enach.png',
  'assets/quiz.png',
  'assets/ev.png'
];

List<String> gridText1 = [
  'Two Wheeler',
  'Personal',
  'Pay EMIs',
  'Credit',
  'Bike',
  'eNach',
  'Quiz &',
  'EV Charging'
];
List<String> gridText2 = [
  'Loan',
  'Loan',
  ' ',
  'Score',
  'Servicing',
  ' ',
  'Game',
  'Location',
];
