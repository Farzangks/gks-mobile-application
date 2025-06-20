import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_button.dart';

class ProfileSection extends StatefulWidget {
  final String name;
  final String contact;

  const ProfileSection({
    super.key,
    required this.name,
    required this.contact,
  });

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  int _currentRating = 0; // To store the user's rating
  CroppedFile? _refImage;

  _imgFromGallery() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (image != null) {
      _cropImage(File(image.path));
    }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              _refImage != null
                  ? Container(
                clipBehavior: Clip.antiAlias,
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.file(
                  File(_refImage!.path),
                  fit: BoxFit.cover,
                ),
              )
                  : Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 16),
              Text('Name: ${widget.name}'),
              Text('Contact: ${widget.contact}'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _imgFromGallery,
                    child: const Text('Choose File'),
                  ),
                  const SizedBox(width: 16),
                  CustomButton(
                    onPressed: () {},
                    text: 'Save Photo',
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}