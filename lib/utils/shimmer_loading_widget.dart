
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color _shimmerColor = Colors.grey[200]!;
Color _shimmerColorDark = Colors.grey[800]!;

class ShimmerLoadingWidget {
  Widget buildShimmerContent() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 110,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 80,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              child: Container(
                                  decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: Colors.white,
                              )),
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              child: Container(
                                  decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: Colors.white,
                              )),
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              width: 100,
                              child: Container(
                                  decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: Colors.white,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                period: const Duration(milliseconds: 1000),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                color: _shimmerColor,
                height: 1),
          ],
        );
      },
    );
  }

  Widget buildShimmerImageHorizontal(boxImageSize) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  width: boxImageSize,
                  height: boxImageSize,
                  color: _shimmerColor,
                ),
              ),
            ),
            period: const Duration(milliseconds: 1000),
          ),
        );
      },
    );
  }

  Widget buildShimmerHorizontalProduct(boxImageSize) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: const Duration(milliseconds: 1000),
              child: Container(
                width: boxImageSize,
                height: boxImageSize,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        width: boxImageSize,
                        height: boxImageSize,
                        color: _shimmerColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Row(
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Icon(Icons.star,
                                    color: _shimmerColor, size: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerProductDiscount(boxImageSize) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Container(
              width: boxImageSize,
              height: boxImageSize,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColor,
                        period: const Duration(milliseconds: 1000),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            width: boxImageSize,
                            height: boxImageSize,
                            color: _shimmerColor,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 10,
                        child: Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: _shimmerColorDark,
                          period: Duration(milliseconds: 1000),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _shimmerColorDark,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6))),
                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Container(
                              width: 20,
                              height: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: _shimmerColor,
                    period: Duration(milliseconds: 1000),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerProductDiscount2(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      primary: false,
      childAspectRatio: 4 / 6.7,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: _shimmerColor,
                      period: Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColorDark,
                        period: Duration(milliseconds: 1000),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _shimmerColorDark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))),
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Container(
                            width: 20,
                            height: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerBannerSlider(bannerWidth, bannerHeight) {
    return Column(
      children: [
        Container(
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor:
                _shimmerColor,
            child: Container(
              child: Container(
                width: bannerWidth,
                height: bannerHeight,
                color:
                     _shimmerColor,
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                     _shimmerColor,
                ),
              );
            })),
      ],
    );
  }

  Widget buildShimmerBannerActivity(bannerWidth, bannerHeight) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: Container(
                width: bannerWidth,
                height: bannerHeight,
                color: _shimmerColor,
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _shimmerColor,
                ),
              );
            })),
      ],
    );
  }

  Widget buildShimmerBanner(bannerWidth, bannerHeight) {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        child: Container(
          child: Container(
            width: bannerWidth,
            height: bannerHeight,
            color: _shimmerColor,
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }

  Widget buildShimmerProduct(boxImageSize, axisCount, childCount) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: axisCount,
      children: List.generate(childCount, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Container(
                      width: boxImageSize,
                      height: boxImageSize,
                      color: _shimmerColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                          width: 50,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Row(
                          children: [
                            for (int i = 1; i <= 5; i++)
                              Icon(Icons.star, color: _shimmerColor, size: 12),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerTrending(boxImageSize, childCount) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12),
      primary: false,
      childAspectRatio: 4 / 1.6,
      shrinkWrap: true,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      crossAxisCount: childCount,
      children: List.generate(4, (index) {
        return Container(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                period: Duration(milliseconds: 1000),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Container(
                          width: (boxImageSize) * (1.6 / 4) - 12 - 1,
                          height: (boxImageSize) * (1.6 / 4) - 12 - 1,
                          color: _shimmerColor,
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      }),
    );
  }

  Widget buildShimmerCategory(childCount) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: childCount,
      children: List.generate(8, (index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Column(children: [
            Container(
              width: 40,
              height: 40,
              color: _shimmerColor,
            ),
            SizedBox(
              height: _spaceHeight,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _shimmerColor,
              ),
              height: 12,
            ),
          ]),
        );
      }),
    );
  }

  Widget buildCustomShimmerCategory(childCount, rowCount) {
    return GridView.count(
      primary: false,
      childAspectRatio: 16 / 9,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: childCount,
      children: List.generate(rowCount, (index) {
        return Shimmer.fromColors(
          highlightColor:  Colors.white,
          baseColor:  _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Column(children: [
            Container(
              width: 40,
              height: 40,
              color:  _shimmerColor,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:
                     _shimmerColor,
              ),
              height: 12,
            ),
          ]),
        );
      }),
    );
  }

  Widget buildShimmerCategoryHorizontal() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.07,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      scrollDirection: Axis.horizontal,
      children: List.generate(16, (index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Column(children: [
            Container(
              width: 40,
              height: 40,
              color: _shimmerColor,
            ),
            SizedBox(
              height: _spaceHeight,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _shimmerColor,
              ),
              height: 12,
            ),
          ]),
        );
      }),
    );
  }

  Widget buildShimmerList() {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        period: Duration(milliseconds: 1000),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class GharkasathiUnifiedShimmer extends StatelessWidget {
  // Common color constants
  final Color _shimmerBaseColor = Colors.grey[200]!;
  final Color _shimmerHighlightColor = Colors.white;

  GharkasathiUnifiedShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return a simple container with fixed height to prevent layout issues
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: Shimmer.fromColors(
        baseColor: _shimmerBaseColor,
        highlightColor: _shimmerHighlightColor,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image area
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),

              // Content area
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Container(
                      height: 12,
                      width: double.infinity,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 8),

                    // Price
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 8),

                    // Location
                    Container(
                      height: 10,
                      width: 150,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // Usage example
// class GharkasathiShimmerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GharkasathiUnifiedShimmer(),
//     );
//   }
// }


class GharkasathiShimmerLoader {
  // Define common colors and dimensions
  static final Color _shimmerBaseColor = Colors.grey[200]!;
  static final Color _shimmerHighlightColor = Colors.white;
  static final Color _shimmerAccentColor = Color(0xFFBF2B27); // App theme red color
  static const double _spaceHeight = 10.0;

  // Property listing shimmer (for the main screen properties)
  Widget buildPropertyListingShimmer(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - 48) / 2; // Two cards per row with spacing

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner area
        // buildBannerShimmer(context),
        // SizedBox(height: 16),

        // "View All Property" header
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Shimmer.fromColors(
        //         baseColor: _shimmerBaseColor,
        //         highlightColor: _shimmerHighlightColor,
        //         child: Container(
        //           height: 24,
        //           width: 120,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //       Shimmer.fromColors(
        //         baseColor: _shimmerBaseColor,
        //         highlightColor: _shimmerHighlightColor,
        //         child: Container(
        //           height: 16,
        //           width: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 16),

        // Property cards (2 per row)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPropertyCardShimmer(cardWidth),
              buildPropertyCardShimmer(cardWidth),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       buildPropertyCardShimmer(cardWidth),
        //       buildPropertyCardShimmer(cardWidth),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  // Banner shimmer for property image carousel
  Widget buildBannerShimmer(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Shimmer.fromColors(
            baseColor: _shimmerBaseColor,
            highlightColor: _shimmerHighlightColor,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Banner Image
        Shimmer.fromColors(
          baseColor: _shimmerBaseColor,
          highlightColor: _shimmerHighlightColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 180,
            width: screenWidth - 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),
        ),

        // Dots indicator
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Shimmer.fromColors(
                baseColor: _shimmerBaseColor,
                highlightColor: _shimmerHighlightColor,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // Property card shimmer
  Widget buildPropertyCardShimmer(double width) {
    return Shimmer.fromColors(
      baseColor: _shimmerBaseColor,
      highlightColor: _shimmerHighlightColor,
      child: Container(
        width: width,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property image
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
            ),

            // Buy tag
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 24,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _shimmerAccentColor.withOpacity(0.7),
                ),
              ),
            ),

            // Property title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 16,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: _spaceHeight),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 16,
                width: width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: _spaceHeight),

            // Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 14,
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Service categories shimmer (for the second screen)
  Widget buildServiceCategoriesShimmer(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Shimmer.fromColors(
          baseColor: _shimmerBaseColor,
          highlightColor: _shimmerHighlightColor,
          child: Container(
            height: 50,
            color: _shimmerAccentColor,
          ),
        ),
        SizedBox(height: 8),

        // "In-House Services" subheader
        Center(
          child: Shimmer.fromColors(
            baseColor: _shimmerBaseColor,
            highlightColor: _shimmerHighlightColor,
            child: Container(
              height: 16,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Banner with cleaners image
        Shimmer.fromColors(
          baseColor: _shimmerBaseColor,
          highlightColor: _shimmerHighlightColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 180,
            width: screenWidth - 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),
        ),

        // Dots indicator
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Shimmer.fromColors(
                baseColor: _shimmerBaseColor,
                highlightColor: _shimmerHighlightColor,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 16),

        // Service categories grid (3 columns)
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: 9, // 9 service categories shown
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: _shimmerBaseColor,
              highlightColor: _shimmerHighlightColor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon placeholder
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _shimmerAccentColor.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Label placeholder
                    Container(
                      height: 12,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Function to use in tab-based interface for both home and services views
  Widget buildTabShimmerUI(BuildContext context, int tabIndex) {
    return SafeArea(
      child: Column(
        children: [
          // App Bar
          Shimmer.fromColors(
            baseColor: _shimmerAccentColor,
            highlightColor: _shimmerHighlightColor.withOpacity(0.3),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: _shimmerAccentColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu icon
                  Container(
                    height: 24,
                    width: 24,
                    color: Colors.white.withOpacity(0.5),
                  ),

                  // Logo placeholder
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),

                  // Cart and notification icons
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tab Bar
          Shimmer.fromColors(
            baseColor: _shimmerBaseColor,
            highlightColor: _shimmerHighlightColor,
            child: Container(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 60,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: index == tabIndex ? _shimmerAccentColor : Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ),

          // Content based on tab
          Expanded(
            child: tabIndex == 0
                ? buildPropertyListingShimmer(context)
                : buildServiceCategoriesShimmer(context),
          ),
        ],
      ),
    );
  }
}
