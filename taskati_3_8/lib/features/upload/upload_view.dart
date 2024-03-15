import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_3_8/core/constants/assets_icons.dart';
import 'package:taskati_3_8/core/functions/routing.dart';
import 'package:taskati_3_8/core/services/local_storage.dart';
import 'package:taskati_3_8/core/widgets/custom_button.dart';
import 'package:taskati_3_8/core/widgets/custom_dialogs.dart';
import 'package:taskati_3_8/features/home/presentation/view/home_view.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  // cached your data
                  AppLocalStorage.cacheData('name', name);
                  AppLocalStorage.cacheData('image', path);
                  AppLocalStorage.cacheData('isUpload', true);

                  pushWithReplacment(context, const HomeView());
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please Enter Your Name');
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please Upload Your Image');
                } else {
                  showErrorDialog(
                      context, 'Please Enter Your Name and Upload Your Image');
                }
              },
              child: const Text('Done')),
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : AssetImage(AssetsIcons.user),
              ),
              const Gap(15),
              CustomButton(
                  text: 'Upload From Camera',
                  onPressed: () {
                    uploadImage(isCamera: true);
                  },
                  width: 250),
              const Gap(15),
              CustomButton(
                  text: 'Upload From Gallery',
                  onPressed: () {
                    uploadImage(isCamera: false);
                  },
                  width: 250),
              const Gap(15),
              const Divider(),
              const Gap(15),
              TextFormField(
                // onFieldSubmitted: (value) {
                //   name = value;
                // },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      // change image
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
