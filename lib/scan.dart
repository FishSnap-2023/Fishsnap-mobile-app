import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishsnap/fishDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String? capturedImageUrl; // Variable to store the captured image URL

      @override
      void initState() {
        super.initState();
        requestCameraPermission();
        _initializeCamera();
      }

      Future<void> _initializeCamera() async {
        final cameras = await availableCameras();
        _controller = CameraController(cameras[0], ResolutionPreset.medium);
        _initializeControllerFuture = _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }

      Future<void> requestCameraPermission() async {
        var status = await Permission.camera.status;
        if (!status.isGranted) {
          await Permission.camera.request();
        }
      }

        Future<void> _captureImage() async {
          try {
            await _initializeControllerFuture;
            XFile imageFile = await _controller.takePicture();

              // Get the temporary directory to store the image file
            Directory tempDir = await getTemporaryDirectory();
            String imagePath = '${tempDir.path}/imageName';

            // Move the captured image file to the temporary directory
            File(imageFile.path).renameSync(imagePath);

            // Now, imagePath contains the local path to the captured image
            String? userid = FirebaseAuth.instance.currentUser?.uid;
              // Upload image to Firebase Storage
            String imageUrl = await uploadImageToFirebaseStorage(userid,imagePath);

            // Store image URL in Firestore
            await storeImageUrlInFirestore(imageUrl);

            // Send POST request with image URL
            await sendPostRequest(imageUrl);

            // Handle success or navigate to a new page
                  // Store captured image URL
            capturedImageUrl = imageUrl;

            // Navigate to the result page with captured image URL
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FishDetailsScreen(
                  selectedFishIndex: 0, // You can set the fish index as per your requirement
                  capturedImageUrl: capturedImageUrl, // Pass the captured image URL
                ),
              ),
            );

          } catch (e) {
            print('Error capturing image: $e');
          }
        }
        Future<String> uploadImageToFirebaseStorage(String? userId, String imagePath) async {
          // Generate a random number
          Random random = Random();
          int randomNumber = random.nextInt(10000); // You can adjust the range as per your requirement

          // Salt to make the image name more unique (you can use any string)
          String salt = 'my_salt';

          // Create a unique image name using userId, randomNumber, and salt
          String imageName = '$userId$randomNumber$salt.jpg';

          Reference storageReference = FirebaseStorage.instance.ref().child('images/$imageName');

          UploadTask uploadTask = storageReference.putFile(File(imagePath));

          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

          // Get the download URL of the uploaded image
          String downloadURL = await storageReference.getDownloadURL();

          return downloadURL;
         }

    Future<void> storeImageUrlInFirestore(String imageUrl) async {
        await FirebaseFirestore.instance
            .collection('images')
            .doc()
            .set({'image_url': imageUrl});
    }

    Future<void> sendPostRequest(String imageUrl) async {
        var url = 'http://192.168.8.1:8000/abcd';
        var response = await http.post(Uri.parse(url), body: {'image_url': imageUrl});
        
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan Your Image',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: _captureImage,
          child: const Icon(Icons.camera,size: 40.0),
        ),
      ],
    ),
    
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

