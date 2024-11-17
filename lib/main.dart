import 'package:firsteconomy/bottom_nav.dart';
import 'package:firsteconomy/services/api_helper.dart';
import 'package:firsteconomy/viewmodels/home_banner_bloc/fetch_image_banner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchImageBannerBloc(ApiServices()),
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        home:const BottomNavigation(),
      ),
    );
  }
}
