import 'package:firsteconomy/constants/colors.dart';
import 'package:firsteconomy/constants/height_width.dart';
import 'package:firsteconomy/services/api_helper.dart';
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
        backgroundColor: Colors.black,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(91), child: CustomAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: ApiServices().getBannerImages(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CupertinoActivityIndicator());
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
                                  height:
                                      MediaQuery.of(context).size.height * .22,
                                  width: MediaQuery.of(context).size.width * .8,
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
            const Divider(color: AppColors.whiteColor,indent: 13,endIndent: 13,thickness: .8,)
            ],
          ),
        ),
      ),
    );
  }
}
