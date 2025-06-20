import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SellPropertyForm extends StatefulWidget {
  @override
  _SellPropertyFormState createState() => _SellPropertyFormState();
}

class _SellPropertyFormState extends State<SellPropertyForm> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String propertyType = 'Select Property Type';
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController propertyDetailsController = TextEditingController();
  final controller = Get.put(PropertyServiceController());

  // Animation controller for submit button
  late AnimationController _animationController;

  // Multiple images support
  List<CroppedFile> _propertyImages = [];
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    propertyNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    locationController.dispose();
    propertyDetailsController.dispose();
    super.dispose();
  }



  Future<void> _pickImage() async {
    try {
      // Use showModalBottomSheet to show options within safe area
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Image Source",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: AppColors.appBarColor),
                    title: Text("Camera"),
                    onTap: () {
                      Navigator.pop(context);
                      _launchCamera();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.photo_library, color: AppColors.appBarColor),
                    title: Text("Gallery"),
                    onTap: () {
                      Navigator.pop(context);
                      _launchGallery();
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print('Error showing image picker: $e');
      _showErrorSnackBar('Failed to launch image picker. Please try again.');
    }
  }

// Launch camera with proper error handling
  Future<void> _launchCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      if (photo != null) {
        _cropImage(File(photo.path));
      }
    } catch (e) {
      print('Error taking photo: $e');
      _showErrorSnackBar('Could not access camera. Please try again.');
    }
  }

// Launch gallery with proper error handling
  Future<void> _launchGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      if (image != null) {
        _cropImage(File(image.path));
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
      _showErrorSnackBar('Could not access gallery. Please try again.');
    }
  }
// Replace your current _cropImage method with this version

  Future<void> _cropImage(File filePath) async {
    try {
      // Create a list of settings for the image cropper
      final List<PlatformUiSettings> settings = [];

      // Add platform-specific settings
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        // For iOS, we need minimal settings to avoid SafeArea issues
        settings.add(
          IOSUiSettings(
            // Basic settings
            title: "Crop Image",
            doneButtonTitle: "Done",
            cancelButtonTitle: "Cancel",

            // Disable problematic UI elements
            rotateButtonsHidden: true,
            aspectRatioPickerButtonHidden: true,
            resetButtonHidden: true,

            // Don't lock aspect ratio to avoid layout issues
            aspectRatioLockEnabled: false,

            // Ensure the image is initially shown properly
            minimumAspectRatio: 0.5,
            rectX: 0,
            rectY: 0,
            rectWidth: 100,
            rectHeight: 100,
          ),
        );
      } else {
        // For Android and other platforms
        settings.add(
          AndroidUiSettings(
            toolbarTitle: "Crop Image",
            toolbarColor: AppColors.appBarColor,
            toolbarWidgetColor: Colors.white,
            statusBarColor: AppColors.appBarColor,

            // Use a simple UI to avoid issues
            hideBottomControls: true,
            lockAspectRatio: false,
            initAspectRatio: CropAspectRatioPreset.original,

            // Additional settings for better UI
            showCropGrid: false,
            backgroundColor: Colors.black,
          ),
        );
      }

      // For web platforms
      settings.add(
        WebUiSettings(
          context: context,
          // Keep web settings minimal
          presentStyle: WebPresentStyle.dialog,
        ),
      );

      // Call the image cropper with our custom settings
      final CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: filePath.path,
        compressQuality: 90,
        // Don't set aspectRatio here to avoid conflicts
        // aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
        uiSettings: settings,
      );

      // Process the result
      if (croppedImage != null) {
        setState(() {
          _propertyImages.add(croppedImage);
        });
      }
    } catch (e) {
      print('Error cropping image: $e');

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error cropping image. Using original image instead.'),
          backgroundColor: Colors.orange,
        ),
      );

      // Use the original image as fallback
      setState(() {
        _propertyImages.add(CroppedFile(filePath.path));
      });
    }
  }
  void _removeImage(int index) {
    setState(() {
      _propertyImages.removeAt(index);
    });
  }

  void _resetForm() {
    setState(() {
      propertyNameController.clear();
      emailController.clear();
      mobileController.clear();
      locationController.clear();
      propertyDetailsController.clear();
      propertyType = 'Select Property Type';
      _propertyImages.clear();
    });
  }

  Future<void> _submitProperty() async {
    if (!_formKey.currentState!.validate()) return;

    if (_propertyImages.isEmpty) {
      _showErrorSnackBar('Please add at least one property image');
      return;
    }

    if (propertyType == 'Select Property Type') {
      _showErrorSnackBar('Please select a property type');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
       controller.sellProperty(
          context,
          propertyNameController.text,
          emailController.text,
          mobileController.text,
          propertyType,
          locationController.text,
          _propertyImages[0].path, // Currently using just the first image as per API
          onSuccess: () {
            setState(() {
              _isSubmitting = false;
            });
            _showSuccessDialog();
          },
          onError: (String message) {
            setState(() {
              _isSubmitting = false;
            });
            _showErrorSnackBar(message);
          }
      );
    } catch (e) {
      setState(() {
        _isSubmitting = false;
      });
      _showErrorSnackBar('An error occurred. Please try again later.');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/gks/success.json',
                  width: 150,
                  height: 150,
                  repeat: false,
                ),
                SizedBox(height: 15),
                Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appBarColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your property has been successfully listed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBarColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Great!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 4),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

// Replace your _buildImagePicker method with this updated version

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Property Images',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Image gallery with SafeArea
              if (_propertyImages.isNotEmpty)
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _propertyImages.length,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(_propertyImages[index].path),
                                width: 180,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => _removeImage(index),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.red[700],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              // Add image button - updated to show single button with improved styling
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _pickImage, // This now shows a modal with camera/gallery options
                    icon: Icon(Icons.add_photo_alternate),
                    label: Text(
                      'Add Property Images',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),

              if (_propertyImages.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Add at least one image of your property',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Sell Your Property',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appBarColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Fill in the details below to list your property',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Owner details section
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Owner Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      'Full Name',
                      propertyNameController,
                      prefixIcon: Icons.person,
                      hintText: 'Enter your full name',
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      'Email Address',
                      emailController,
                      prefixIcon: Icons.email,
                      hintText: 'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      'Mobile Number',
                      mobileController,
                      prefixIcon: Icons.phone,
                      hintText: 'Enter your mobile number',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // Property details section
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Property Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildDropdown(),
                    SizedBox(height: 15),
                    _buildTextField(
                      'Location',
                      locationController,
                      prefixIcon: Icons.location_on,
                      hintText: 'Enter property location',
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      'Property Description',
                      propertyDetailsController,
                      prefixIcon: Icons.description,
                      hintText: 'Describe your property...',
                      maxLines: 4,
                    ),
                    SizedBox(height: 15),
                    _buildImagePicker(),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Submit button
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isSubmitting ? 60 : double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitProperty,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_isSubmitting ? 30 : 15),
                      ),
                      elevation: 3,
                      shadowColor: AppColors.appBarColor.withOpacity(0.5),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: _isSubmitting
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 3,
                    )
                        : Text(
                      'Submit Property',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController controller, {
        IconData? prefixIcon,
        String? hintText,
        int maxLines = 1,
        TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.appBarColor)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: AppColors.appBarColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.red.shade300),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 0,
            ),
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }

            if (label == 'Email Address' && !GetUtils.isEmail(value)) {
              return 'Please enter a valid email address';
            }

            if (label == 'Mobile Number' && value.length != 10) {
              return 'Please enter a valid 10-digit mobile number';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Property Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          value: propertyType,
          items: <String>[
            'Select Property Type',
            'Apartment',
            'House',
            'Villa',
            'Penthouse',
            'Land',
            'Commercial Space',
            'Office Space',
            'Shop',
            'Warehouse',
            'Farm House',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.home, color: AppColors.appBarColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: AppColors.appBarColor, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
          icon: Icon(
            Icons.arrow_drop_down_circle,
            color: AppColors.appBarColor,
          ),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            setState(() {
              propertyType = newValue!;
            });
          },
          validator: (value) {
            if (value == 'Select Property Type') {
              return 'Please select a property type';
            }
            return null;
          },
        ),
      ],
    );
  }
}