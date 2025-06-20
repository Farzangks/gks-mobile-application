import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  // final String imageUrl;
  final String imageUrl;
   BannerCard({super.key,
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.asset( height: 100,
          imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
          // This section simulates the loading shimmer effect
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey,
                    child: frame != null
                        ? child
                        : const SizedBox(), // Replace shimmer with the image when loaded
                  ),
                ),
              ),
            );
          },
        )

        // CachedNetworkImage(
        //     imageUrl: '$baseUrl$imageUrl',
        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
        //       Shimmer.fromColors(
        //         highlightColor: Colors.white,
        //         baseColor: Colors.grey.shade300,
        //         child: Container(
        //           decoration: const BoxDecoration(
        //               color: Colors.grey,
        //               borderRadius: BorderRadius.all(Radius.circular(10))
        //           ),
        //           child: ClipRRect(
        //             borderRadius: const BorderRadius.all(Radius.circular(10)),
        //             child: AspectRatio(
        //               aspectRatio: 16/9,
        //               child: Container(
        //                 color: Colors.grey,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        // ),
      ),
    );
  }
}

