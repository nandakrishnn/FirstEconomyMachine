import 'package:auto_size_text/auto_size_text.dart';
import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/services/api_helper.dart';
import 'package:firsteconomy/viewmodels/home_banner_bloc/fetch_image_banner_bloc.dart';
import 'package:firsteconomy/widgets/custom_grid_container.dart';
import 'package:firsteconomy/widgets/dots_indicator.dart';
import 'package:firsteconomy/widgets/error_banner.dart';
import 'package:firsteconomy/widgets/invite_container.dart';
import 'package:firsteconomy/widgets/shimmer_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                BlocProvider(
                  create: (context) => FetchImageBannerBloc(ApiServices())
                    ..add(FetchBannerData()),
                  child:
                      BlocConsumer<FetchImageBannerBloc, FetchImageBannerState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FetchImageBannerLoading) {
                        return const ShimmerBanner();
                      }
                      if (state is FetchImageBannerFailure) {
                        return const ErrorBanner();
                      }
                      if (state is FetchImageBannerLoaded) {
                        final bannerImages = state.data;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .20,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: bannerImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                bannerImages[index].bannerImage,
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
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
                      child: AutoSizeText(
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
                const InviteContainer(
                  inviteHeaderl: 'Invite your friends',
                  inviteSubtext:
                      'Get upto 10000 coins when you friends sign up for\nCWC app',
                  buttonText: 'Send Invite',
                  imageurl: 'assets/welcome.png',
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
