import 'package:firsteconomy/constants/colors.dart';
import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: MediaQuery.of(context).size.height * .20,
      child:  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .20,
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:const Center(child: Text('Failed to load Image :(',style: TextStyle(color: AppColors.whiteColor),)),
                  ),
                ),
              );
            }),
    );
  }
}