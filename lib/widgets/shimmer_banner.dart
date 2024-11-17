import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
             height: MediaQuery.of(context).size.height * .20,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .20,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
