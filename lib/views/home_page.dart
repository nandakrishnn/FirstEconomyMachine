import 'package:auto_size_text/auto_size_text.dart';
import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/services/api_helper.dart';
import 'package:firsteconomy/viewmodels/home_banner_bloc/fetch_image_banner_bloc.dart';
import 'package:firsteconomy/widgets/custom_divider.dart';
import 'package:firsteconomy/widgets/custom_grid_container.dart';
import 'package:firsteconomy/widgets/dots_indicator.dart';
import 'package:firsteconomy/widgets/error_banner.dart';
import 'package:firsteconomy/widgets/footer_container.dart';
import 'package:firsteconomy/widgets/gradient_grid_view.dart';
import 'package:firsteconomy/widgets/grid_content.dart';
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
                const CustomDivider(),
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
                  height: MediaQuery.of(context).size.height * .285,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 100,
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return CustomContainerGrid(
                          imageUrl: gridImages[index],
                          text1: gridText1[index],
                          text2: gridText2[index],
                          gradient: getGradient(index),
                          gradient2: getGradient2(index),
                        );
                      }),
                ),
                AppConstants.kheight10,
                const CustomDivider(),
                AppConstants.kheight10,
                const InviteContainer(
                  inviteHeaderl: 'Invite your friends',
                  inviteSubtext:
                      'Get upto 10000 coins when you friends sign up for\nCWC app',
                  buttonText: 'Send Invite',
                  imageurl: 'assets/welcome.png',
                ),
                AppConstants.kheight20,
                const CustomDivider(),
                AppConstants.kheight30,
                const FooterContainer(
                  imageUrl: 'assets/mainbike.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
