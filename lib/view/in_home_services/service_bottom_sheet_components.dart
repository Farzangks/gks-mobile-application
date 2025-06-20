import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/order_summary_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cart_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';

class CartItem {
  final String serviceName;
  final String finalSelection;
  final double price;
  final String serviceCategory;
  final String serviceSubcategory;
  final String imagePath;
  int quantity; // Add quantity field

  CartItem({
    required this.serviceName,
    required this.finalSelection,
    required this.price,
    required this.serviceCategory,
    required this.serviceSubcategory,
    this.imagePath = '',
    this.quantity = 1, // Default quantity is 1
  });
}

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxMap<String, bool> addedToCartMap = <String, bool>{}.obs;

  void addToCart(CartItem item) {
    // Create a unique key for this service
    String serviceKey =
        '${item.serviceCategory}_${item.serviceSubcategory}_${item.finalSelection}';

    // Check if this item is already in the cart
    if (addedToCartMap.containsKey(serviceKey) &&
        addedToCartMap[serviceKey] == true) {
      // Item already in cart, try to increase quantity instead
      increaseQuantity(serviceKey);
      return;
    }

    // Add to cart with initial quantity of 1
    cartItems.add(item);
    addedToCartMap[serviceKey] = true;

    Get.snackbar(
      'Added to Cart',
      '${item.serviceName} added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.appBarColor.withOpacity(0.9),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      icon: const Icon(Icons.shopping_cart, color: Colors.white),
    );
  }

  bool isInCart(String serviceCategory, String serviceSubcategory, String serviceType) {
    String serviceKey = '${serviceCategory}_${serviceSubcategory}_${serviceType}';
    return addedToCartMap.containsKey(serviceKey) &&
        (addedToCartMap[serviceKey] == true);
  }

  // Get cart item by service key
  CartItem? getCartItem(String serviceCategory, String serviceSubcategory, String serviceType) {
    String serviceKey = '${serviceCategory}_${serviceSubcategory}_${serviceType}';

    for (var item in cartItems) {
      String itemKey = '${item.serviceCategory}_${item.serviceSubcategory}_${item.finalSelection}';
      if (itemKey == serviceKey) {
        return item;
      }
    }
    return null;
  }

  // Increase quantity (max 5)
  void increaseQuantity(String serviceKey) {
    for (var item in cartItems) {
      String itemKey = '${item.serviceCategory}_${item.serviceSubcategory}_${item.finalSelection}';
      if (itemKey == serviceKey) {
        if (item.quantity < 5) {
          item.quantity++;
          cartItems.refresh(); // Notify observers
          Get.snackbar(
            'Quantity Updated',
            '${item.serviceName} quantity increased to ${item.quantity}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.appBarColor.withOpacity(0.9),
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 1),
            borderRadius: 10,
          );
        } else {
          Get.snackbar(
            'Maximum Reached',
            'Maximum quantity (5) reached for ${item.serviceName}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange.withOpacity(0.9),
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
            borderRadius: 10,
            icon: const Icon(Icons.warning, color: Colors.white),
          );
        }
        break;
      }
    }
  }

  // Decrease quantity (min 1, remove if goes to 0)
  void decreaseQuantity(String serviceKey) {
    for (int i = 0; i < cartItems.length; i++) {
      var item = cartItems[i];
      String itemKey = '${item.serviceCategory}_${item.serviceSubcategory}_${item.finalSelection}';
      if (itemKey == serviceKey) {
        if (item.quantity > 1) {
          item.quantity--;
          cartItems.refresh(); // Notify observers
          Get.snackbar(
            'Quantity Updated',
            '${item.serviceName} quantity decreased to ${item.quantity}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.appBarColor.withOpacity(0.9),
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 1),
            borderRadius: 10,
          );
        } else {
          // Remove from cart if quantity would go to 0
          removeFromCart(i);
        }
        break;
      }
    }
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      CartItem item = cartItems[index];
      String serviceKey =
          '${item.serviceCategory}_${item.serviceSubcategory}_${item.finalSelection}';

      // Remove from the cart
      cartItems.removeAt(index);
      addedToCartMap[serviceKey] = false;

      Get.snackbar(
        'Removed from Cart',
        '${item.serviceName} removed from your cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        icon: const Icon(Icons.remove_shopping_cart, color: Colors.white),
      );
    }
  }

  void clearCart() {
    cartItems.clear();
    addedToCartMap.clear();
  }

  // Calculate total price considering quantities
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Calculate total item count considering quantities
  int get cartCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Get total unique services count
  int get uniqueServicesCount => cartItems.length;
}

class ServiceBottomSheetComponents extends StatefulWidget {
  static String tag = '/ElectricianDetailsScreen';
  final List<dynamic>? serviceTypeList;
  final List<String>? serviceSubTypeList;
  final String? serviceType;
  final String? serviceCategory;
  final String? serviceSubCategory;
  final String? imagePath;
  final String? serviceTypeTitle;
  final String? serviceSubTypeTitle;
  final bool showServiceType;
  final bool showServiceSubType;
  final Function(String? selectedServiceType, String? selectedProjectType, bool added)? onActionPressed;

  const ServiceBottomSheetComponents({
    super.key,
    this.serviceTypeList,
    this.serviceSubTypeList,
    this.onActionPressed,
    this.serviceType,
    this.serviceCategory,
    this.serviceSubCategory,
    this.imagePath,
    this.serviceTypeTitle = "Select Service Type",
    this.serviceSubTypeTitle = "Select Project Type",
    bool? showServiceType,  // Make nullable temporarily
    bool? showServiceSubType,  // Make nullable temporarily
  }) :
        showServiceType = showServiceType ?? true,  // Provide default if null
        showServiceSubType = showServiceSubType ?? false;  // Provide default if null

  @override
  State<ServiceBottomSheetComponents> createState() =>
      _ServiceBottomSheetComponentsState();
}


class _ServiceBottomSheetComponentsState
    extends State<ServiceBottomSheetComponents> {
  final controller = PropertyServiceController();
  late final CartController cartController;
  String? _selectedServiceType;
  String? _selectedServiceTypeDisplay;
  String? _selectedProjectType;
  double _price = 0.0;
  bool _isAdded = false;

  // Map to store price for each service type
  final Map<String, double> _priceMap = {};

  @override
  void initState() {
    super.initState();

    // Safe initialization with error handling
    try {
      cartController = Get.find<CartController>();
    } catch (e) {
      print("Error finding CartController: $e");
      cartController = Get.put(CartController());
    }

    // Try to get service pricing
    try {
      controller.getServicePricing();
    } catch (e) {
      print("Error getting service pricing: $e");
    }

    // Check if service is in cart
    _checkIfInCart();

    // Build price map
    _buildPriceMap();

    // Initialize first option
    _initializeFirstOption();
  }

  // Check if service is in cart
  void _checkIfInCart() {
    try {
      // Add robust checks for necessary widget properties being non-null and list not empty
      if (widget.serviceType != null &&
          widget.serviceCategory != null &&
          widget.serviceTypeList != null &&
          widget.serviceTypeList!.isNotEmpty) {
        // Get first service type safely
        dynamic firstItem = widget.serviceTypeList!.first;
        String firstType = _getServiceTypeString(firstItem);

        // Ensure firstType is not empty before calling isInCart
        if (firstType.isNotEmpty) {
          // The isInCart method itself should handle potential nulls from its map lookup
          _isAdded = cartController.isInCart(
              widget.serviceType!, widget.serviceCategory!, firstType);
          print(_isAdded);
        } else {
          _isAdded = false; // Default to not added if type string is empty
        }
      } else {
        _isAdded =
            false; // Default to not added if critical widget properties are null or list is empty
      }
    } catch (e) {
      print("Error checking if in cart: $e");
      _isAdded = false; // Default to false on error
    }
  }

  // Build a map of service type to price
  void _buildPriceMap() {
    // Add null check for the serviceTypeList
    if (widget.serviceTypeList == null || widget.serviceTypeList!.isEmpty)
      return;

    try {
      for (var item in widget.serviceTypeList!) {
        // Add null check for the current item in the list
        if (item == null) continue;

        if (item is Map<String, dynamic>) {
          // Safely access keys using []? and check for null
          final type = item['type'];
          if (type != null) {
            String typeString = type.toString();
            final price = item['price'];
            if (price != null) {
              try {
                String priceStr = price.toString().replaceAll(',', '');
                if (priceStr.isNotEmpty) {
                  double parsedPrice = double.parse(priceStr);
                  _priceMap[typeString] = parsedPrice;
                }
              } catch (e) {
                print("Error parsing price for $typeString: $e");
              }
            }
          }
        } else if (item is String) {
          // For string items, we don't have price directly in the item, rely on _priceMap lookup later
        }
      }
    } catch (e) {
      print("Error building price map: $e");
    }

    print("Price map built: $_priceMap");
  }

  // Helper method to get type string from either a String or a Map<String, dynamic>
  String _getServiceTypeString(dynamic typeItem) {
    if (typeItem == null) return "";

    try {
      if (typeItem is String) {
        return typeItem;
      } else if (typeItem is Map<String, dynamic> &&
          typeItem.containsKey("type")) {
        final type = typeItem["type"];
        return type != null ? type.toString() : "";
      }
    } catch (e) {
      print("Error getting service type string: $e");
    }

    return "";
  }

  // Helper method to get price from a service type item or lookup in the price map
  double _getServiceTypePrice(dynamic typeItem) {
    if (typeItem == null) return 0.0;

    try {
      // First try to get price directly from the item if it's a map
      if (typeItem is Map<String, dynamic> &&
          typeItem.containsKey("price") &&
          typeItem["price"] != null) {
        try {
          String priceStr = typeItem["price"].toString().replaceAll(',', '');
          if (priceStr.isNotEmpty) {
            return double.parse(priceStr);
          }
        } catch (e) {
          print("Error parsing price directly from item: $e");
        }
      }

      // If not found or parsing failed, try to look up in the price map using the type string
      String typeString = _getServiceTypeString(typeItem);
      if (typeString.isNotEmpty && _priceMap.containsKey(typeString)) {
        return _priceMap[typeString]!;
      }
    } catch (e) {
      print("Error getting service type price: $e");
    }

    return 0.0; // Default price if not found or error
  }

  // Check if a price exists for this type
  // bool _hasPriceForType(String typeString) {
  //   if (typeString.isEmpty) return false;
  //   return _priceMap.containsKey(typeString);
  // }

  // Initialize with the first option
  void _initializeFirstOption() {
    try {
      // Add check for non-null and non-empty list
      if (widget.serviceTypeList != null &&
          widget.serviceTypeList!.isNotEmpty) {
        dynamic firstOption = widget.serviceTypeList!.first;
        // Add null check for the first option itself
        if (firstOption != null) {
          String typeString = _getServiceTypeString(firstOption);
          if (typeString.isNotEmpty) {
            double typePrice = _getServiceTypePrice(firstOption);

            setState(() {
              _selectedServiceType = typeString;
              _selectedServiceTypeDisplay = typeString;
              _price = typePrice > 0
                  ? typePrice
                  : _price; // Update price only if a valid price is found
            });
          }
        }
      }
    } catch (e) {
      print("Error initializing first option: $e");
    }
  }

  // Update price based on selected service type
  void _updatePrice(String typeString) {
    if (typeString.isEmpty) return;

    try {
      // Try to find price in the price map first
      if (_priceMap.containsKey(typeString)) {
        setState(() {
          _price = _priceMap[typeString]!;
        });
        return;
      }

      // If not in price map, try to determine from service type name and controller data
      setState(() {
        // Add checks for controller and pricing list being non-null and non-empty
        if (controller.getServicePricingList.isNotEmpty) {
          // Add a defensive null check for the first element before accessing properties
          final pricingInfo = controller.getServicePricingList.first;
          if (pricingInfo != null) {
            if (typeString.toLowerCase().contains('basic cleaning') ||
                typeString.toLowerCase() == 'basic full home cleaning') {
              // Add null check for basicCleaning property
              double? basicPrice =
              double.tryParse(pricingInfo.basicCleaning?.toString() ?? '');
              _price = basicPrice ?? 0.0; // Use parsed price or 0 if no price available
            } else if (typeString.toLowerCase().contains('deep cleaning') ||
                typeString.toLowerCase() == 'deep full home cleaning') {
              // Add null check for deepCleaning property
              double? deepPrice =
              double.tryParse(pricingInfo.deepCleaning?.toString() ?? '');
              _price = deepPrice ?? 0.0; // Use parsed price or 0 if no price available
            }  else {
              // Keep current price or set a default if none
              _price = _price > 0 ? _price : 2999.0;
            }
          } else {
            // If pricingInfo is unexpectedly null, keep current price or set a default
            _price = _price > 0 ? _price : 2999.0;
          }
        } else {
          // If pricing list is empty, keep current price or set a default
          _price = _price > 0 ? _price : 2999.0;
        }
      });
    } catch (e) {
      print("Error updating price: $e");
      setState(() {
        _price = 2999.0; // Default fallback on error
      });
    }
  }

// Update the _addToCart method in ServiceBottomSheetComponents
  void _addToCart() {
    // Add explicit null check for _selectedServiceType
    if (_selectedServiceType == null || _selectedServiceType!.isEmpty) {
      Get.snackbar(
        'Selection Required',
        'Please select a service type first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      );
      return;
    }

    try {
      // Create cart item with the correct values, using 0.0 as price if no price available
      CartItem item = CartItem(
        serviceName: widget.serviceSubCategory ?? 'Service',
        finalSelection: _selectedServiceTypeDisplay ?? _selectedServiceType!,
        price: _price > 0 ? _price : 0.0, // Use 0.0 if no price available
        serviceCategory: widget.serviceType ?? 'Category',
        serviceSubcategory: widget.serviceCategory ?? 'Subcategory',
        imagePath: widget.imagePath ?? '',
        quantity: 1, // Initialize with quantity 1
      );

      // Add to cart
      cartController.addToCart(item);

      setState(() {
        _isAdded = true;
      });

      // Call the callback if provided, using null-aware access
      widget.onActionPressed?.call(_selectedServiceType, _selectedProjectType, true);

      // Close the bottom sheet
      Navigator.of(context).pop();
    } catch (e) {
      print("Error adding to cart: $e");
      Get.snackbar(
        'Error',
        'Failed to add to cart. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      );
    }
  }

  void _viewCart() {
    try {
      // Navigate to cart screen, using null-aware access
      Get.to(() => CartScreen(cartController: cartController));

      // Close the bottom sheet
      Navigator.of(context).pop();
    } catch (e) {
      print("Error viewing cart: $e");
      Get.snackbar(
        'Error',
        'Failed to open cart. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      );
    }
  }

  Widget _buildServiceTypeOption(dynamic typeItem) {
    // Explicitly check if typeItem is null before proceeding
    if (typeItem == null) {
      return SizedBox.shrink();
    }

    try {
      String typeString = "";
      bool hasPrice = false;
      double typePrice = 0.0;

      // Safely extract typeString and price based on the type of typeItem
      if (typeItem is String) {
        typeString = typeItem;
        // For string items, price needs to be looked up separately if available
        hasPrice = _priceMap.containsKey(typeString);
        if (hasPrice) {
          typePrice = _priceMap[typeString]!;
        }
      } else if (typeItem is Map<String, dynamic>) {
        // Safely access map keys using []? and check for null
        final type = typeItem['type'];
        if (type != null) {
          typeString = type.toString();
          final price = typeItem['price'];

          // Only process price if it exists and is not null
          if (price != null && price.toString().isNotEmpty) {
            try {
              // Attempt to parse price, handling potential errors
              String priceStr = price.toString().replaceAll(',', '');
              if (priceStr.isNotEmpty) {
                typePrice = double.parse(priceStr);
                hasPrice = true;
              }
            } catch (e) {
              print("Error parsing price from map for $typeString: $e");
              // If parsing fails, don't show price
              hasPrice = false;
            }
          }

          // If no price in the item, check the price map as fallback
          if (!hasPrice && _priceMap.containsKey(typeString)) {
            typePrice = _priceMap[typeString]!;
            hasPrice = true;
          }
        }
      }

      // If typeString is still empty after attempts, skip this item
      if (typeString.isEmpty) {
        return SizedBox.shrink();
      }

      // Check if this is the selected type
      final bool isSelected = ((_selectedServiceType ?? '') == typeString);

      // Format price text, only show if price is available and greater than 0
      String priceText = hasPrice && typePrice > 0 ? "₹${typePrice.toStringAsFixed(0)}" : "";

      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedServiceType = typeString;
            _selectedServiceTypeDisplay = typeString;
            // Only update price if we have a valid price
            if (hasPrice && typePrice > 0) {
              _price = typePrice;
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.appBarColor.withOpacity(0.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.appBarColor : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.appBarColor : Colors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.appBarColor : Colors.grey[400]!,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  typeString,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? AppColors.appBarColor : Colors.black87,
                  ),
                ),
              ),
              // Only show price if it exists and is formatted
              if (priceText.isNotEmpty)
                Text(
                  priceText,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? AppColors.appBarColor : Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      );
    } catch (e) {
      print("Error building service type option: $e");
      // Return an empty SizedBox in case of any unexpected error during rendering
      return SizedBox.shrink();
    }
  }

  Widget _buildProjectTypeOption(String type) {
    // The bool isSelected will be false if _selectedProjectType is null,
    // so this comparison is safe. Adding a redundant null check for type
    // for extreme robustness, though type is a non-nullable String parameter.
    if (type == null)
      return SizedBox.shrink(); // Should not happen with String type

    // Ensure _selectedProjectType is treated as empty string if null for comparison safety, and cast to bool
    final bool isSelected = ((_selectedProjectType ?? '') == type);

    return GestureDetector(
      onTap: () {
        print(isSelected);
        setState(() {
          _selectedProjectType = type;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.appBarColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.appBarColor : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.appBarColor : Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.appBarColor : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                type,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? AppColors.appBarColor : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.showServiceType);
    print(widget.showServiceSubType);
    print(_isAdded);
    // Force boolean values for section visibility with null-aware operator and explicit cast
    // Also check if the corresponding lists are non-null and non-empty
    final bool displayServiceType =
        widget.serviceTypeList != null &&
        widget.serviceTypeList!.isNotEmpty;

    final bool displayServiceSubType =
        widget.serviceSubTypeList != null &&
        widget.serviceSubTypeList!.isNotEmpty;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Options',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 1, height: 24),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Type Section - Only show if displayServiceType is true
                  if (displayServiceType) ...[
                    Text(
                      widget.serviceTypeTitle ?? "Select Service Type",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Service Type Options - Explicit null safety
                    if (widget.serviceTypeList != null)
                      for (var typeItem in widget.serviceTypeList!)
                        if (typeItem != null) _buildServiceTypeOption(typeItem),

                    const SizedBox(height: 24),
                  ],

                  // Project Type Section - Only show if displayServiceSubType is true
                  if (displayServiceSubType) ...[
                    Text(
                      widget.serviceSubTypeTitle ?? "Select Project Type",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Project Type Options - Explicit null safety
                    if (widget.serviceSubTypeList != null)
                      for (var type in widget.serviceSubTypeList!)
                        _buildProjectTypeOption(type),

                    const SizedBox(height: 24),
                  ],

                  // Price Section
                  // Replace the Price Section in the build method of ServiceBottomSheetComponents:
// Price Section - Only show if there's a valid price
                  if (_selectedServiceType != null && _price > 0) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Service Charge'),
                              Text(
                                '₹ ${_price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Convenience Fee (3%)'),
                              Text(
                                '₹ ${(_price * 0.03).toStringAsFixed(2)}',
                              ),
                            ],
                          ),
                          const Divider(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹ ${(_price * 1.03).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.appBarColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ] else if (_selectedServiceType != null) ...[
                    // Show message when service type is selected but no price available
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[600]),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Price will be provided upon consultation',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Action Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: (_isAdded)
                ? SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _viewCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text(
                      'View Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
                : SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Enable button if service type is selected, regardless of price
                onPressed: _selectedServiceType != null ? _addToCart : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 8),
                    Text(
                      _price > 0 ? 'Add to Cart' : 'Request Quote',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
