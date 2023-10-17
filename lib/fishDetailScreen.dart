import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> loadFishData() async {
  String data = await rootBundle.loadString('assets/fish_data.json');
  List<dynamic> jsonData = json.decode(data);
  return jsonData.cast<Map<String, dynamic>>();
}
class FishDetailsScreen extends StatelessWidget {
  final int selectedFishIndex;
  final String? capturedImageUrl; // Add this variable to accept the captured image URL

  FishDetailsScreen({
    required this.selectedFishIndex,
    required this.capturedImageUrl, // Add this parameter to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: loadFishData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while data is being loaded
        } else if (snapshot.hasError) {
          return Text('Error loading data: ${snapshot.error}');
        } else {
          Map<String, dynamic> selectedFish = snapshot.data![selectedFishIndex];
          // Display selected fish data (selectedFish['name'], selectedFish['species'], selectedFish['description'])
          return Scaffold(
            appBar: AppBar(
              title: Text(
                selectedFish['name']),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Name: ${selectedFish['name']}'),
                  Text('Species: ${selectedFish['scientific name']}'),
                  Text('Description: ${selectedFish['description']}'),
                  //Image.network widget to load the image from the URL:
                  if (capturedImageUrl != null)
                    Image.network(
                      capturedImageUrl!, // Use the captured image URL here
                      width: 200, // Set the width as per your requirement
                      height: 200, // Set the height as per your requirement
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

