import 'package:flutter/material.dart';
// import 'package:ghar_ka_sathi/src/real_eastate/real_eastate_screen.dart';

class PropertyListComponents extends StatefulWidget {
  final List<String> bannerList ;
  final List<Map<String, String>> propertyList ;
  const PropertyListComponents({super.key,required this.bannerList,required this.propertyList});

  @override
  State<PropertyListComponents> createState() => _PropertyListComponentsState();
}

class _PropertyListComponentsState extends State<PropertyListComponents> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [

          // CarouselSliderView(
          //   bannerList: widget.bannerList,
          //   onPressed: () {},
          // ),
          // // ViewAllSectionTitle(
          // //   title: "View All Property",
          // //   onTap: () {
          // //     Get.to(() => const AllPropertyListScreen());
          // //   },
          // // ),
          _buildRealStateServiceCategories(),
        ],
      ),
    );
  }
  Widget _buildRealStateServiceCategories() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenHeight * 0.8, // Adjusted height for a better fit
        child:
        // Obx(
        //         () =>
            //     propertyController.isLoading.value
            //     ? Stack(
            //   children: [
            //     ListView.builder(
            //         scrollDirection: Axis.vertical,
            //         shrinkWrap: true,
            //         itemCount: 10,
            //         itemBuilder: (BuildContext context, int index) {
            //           return ShimmerLoadingWidget()
            //               .buildShimmerBannerSlider(
            //               MediaQuery.of(context).size.width * 0.9,
            //               50.0);
            //         }),
            //   ],
            // ) :
            //     propertyController.errorMsg.value != '' ?
            //     Column(
            //   children: [
            //     Center(
            //       child: Text(propertyController.errorMsg.value),
            //     ),
            //   ],
            // ):
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.6, // Adjusted aspect ratio
                mainAxisSpacing: 16, // Increased space between rows
                crossAxisSpacing: 16, // Increased space between columns
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final property = widget.propertyList[index];
                return GestureDetector(
                  onTap: () {
                    // Add your onTap logic here
                  },
                  child: PropertyCard(
                    price: property["price"]!,
                    details: property["details"]!,
                    title: property["title"]!,
                    location: property["location"]!,
                    image: property["image"]!,
                  ),
                );
              },
            )
        ),
      // ),
    );
  }
}


// PropertyCard Widget
class PropertyCard extends StatefulWidget {
  final String title;
  final String details;
  final String price;
  final String location;
  final String image;

  const PropertyCard(
      {super.key,
        required this.title,
        required this.details,
        required this.price,
        required this.location,
        required this.image,});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorite = false; // State to track favorite status
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Get.to(PropertyDetailPage(
      //     // allPropertyList: widget.allPropertyList,
      //   ));
      // },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      widget.image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  // Positioned(
                  //   top: 8,
                  //   left: 8,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: G,
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     child: Text(
                  //       widget.type,
                  //       style: const TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 8,
                  //   right: 8,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       setState(() {
                  //         isFavorite = !isFavorite; // Toggle favorite state
                  //       });
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(4),
                  //       decoration: const BoxDecoration(
                  //         color: Colors.white,
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Icon(
                  //         isFavorite ? Icons.favorite : Icons.favorite_border,
                  //         color: Colors.red,
                  //         size: 20,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  // Text(widget.details,
                  //     style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    "₹ ${widget.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Container(
                        width: 120,
                        child: Text(widget.location,
                            style: const TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
