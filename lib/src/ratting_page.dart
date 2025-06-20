import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _currentRating = 0; // To store the user's rating
  CroppedFile? _refImage;

  _imgFromGallery() async {
    File image = File((await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25))!
        .path);
    _cropImage(image);
  }

  Future<void> _cropImage(File filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath.path,
      compressQuality: 90,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Adjust Image",
          toolbarColor: AppColors.appBarColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          statusBarColor: AppColors.appBarColor,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: "Adjust Image",
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
        ),
        WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.dialog,
          size: const CropperSize(width: 520, height: 520),
          background: true,
          guides: true,
          scalable: true,
          rotatable: true,
          movable: true,
          cropBoxMovable: true,
          cropBoxResizable: true,
          initialAspectRatio: 1,
        ),
      ],
    );

    if (croppedImage != null) {
      setState(() {
        _refImage = croppedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Replace with the actual image URL
                  ),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demo User',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mo. No.: 9874563210',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Rating Stars
            // Rating Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {

                return InkWell(
                  onTap: () {
                    setState(() {
                      _currentRating = index + 1; // Update the rating
                    });
                  },
                  child:  Icon(
                    index < _currentRating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 25,
                  ),
                );
                // return IconButton(
                //   icon: Icon(
                //     index < _currentRating ? Icons.star : Icons.star_border,
                //     color: Colors.amber,
                //     size: 20,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _currentRating = index + 1; // Update the rating
                //     });
                //   },
                // );
              }),
            ),
            const SizedBox(height: 20),
            // Text Input Field
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Share details of your own experience at this place',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 20),
            // Add Photos Button
            OutlinedButton.icon(
              onPressed: () {
                _imgFromGallery();},
              icon: const Icon(Icons.photo_camera),
              label: const Text('Add photos'),
            ),
            const SizedBox(height: 20),
            _refImage != null?Image.file(
              File(_refImage!.path),
              fit: BoxFit.contain,
            ):Container(),
            const SizedBox(height: 20),
            // Post Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Post',style: TextStyle(color: AppColors.white),),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
