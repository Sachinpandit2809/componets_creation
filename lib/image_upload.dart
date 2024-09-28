import 'dart:io';

import 'package:componets_creation/ext/num_ext.dart';
import 'package:componets_creation/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String? imageUrl;
  final _imagePicker = ImagePicker();
  bool isLoading = false;
  XFile? myImage;
  pickImage() async {
    XFile? res = await _imagePicker.pickImage(source: ImageSource.camera);
    myImage = res;
    if (res != null) {
      // uploadToFirebase(File(res.path));
      uploadFile();
    }
  }

  Future uploadFile() async {
    final storageRef =
        FirebaseStorage.instance.ref().child('images/${myImage!.name}');
    File file = File(myImage!.path);

    try {
      await storageRef.putFile(file).timeout(const Duration(minutes: 2));
    } on FirebaseException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  uploadToFirebase(image) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Create a reference to the specific image file
      String imageFileName =
          'Images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference rs = FirebaseStorage.instance.ref().child(imageFileName);

      // Upload the image
      await rs.putFile(image).whenComplete(() {
        Utils.toastSuccessMessage("Upload successfully");
      });

      // Get the download URL of the uploaded image
      imageUrl = await rs.getDownloadURL();

      setState(() {}); // Refresh the UI
    } catch (e) {
      debugPrint("Firebase upload error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            imageUrl == null
                ? Icon(Icons.person, size: 200)
                : Center(child: Image.network(imageUrl!)),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Center(child: Text("upload Image")),
              ),
            ),
            50.heightBox,
            if (isLoading) const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
