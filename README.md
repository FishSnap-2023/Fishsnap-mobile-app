# Fishsnap-Frontend
![Progress](https://img.shields.io/badge/progress-95%25-brightgreen.svg)

Fishsnap Frontend is a mobile application developed using the Flutter framework with Dart. It is designed to work seamlessly with the Fishsnap Backend, providing a user-friendly interface for users to classify fish species in images. This README will guide you on setting up and using the Fishsnap Frontend mobile application.

![FishSnap-GitHub](https://github.com/ImeshaDilshani/Fishsnap-Frontend/assets/93858302/262093e9-8e81-4422-b2c4-5c66475c2272)


## Requirements
To run Fishsnap Frontend, you need to have Flutter SDK installed on your system. You can download and install Flutter by following the instructions on the official Flutter website: Flutter Installation Guide.

## Clone the Repository

```bash
git clone https://github.com/ImeshaDilshani/Fishsnap-Frontend.git
```
```bash
cd Fishsnap-Frontend
```
## Install the dependencies
```bash
flutter pub get
```
## Run the Application
```bash
flutter run
```
Make sure you have an emulator running or a physical device connected to your computer to deploy the application.

## Using Fishsnap Frontend
Fishsnap Frontend provides an intuitive interface for users to classify fish species in images. Users can capture a photo using the device's camera. The application then sends the image to the Fishsnap Backend using flask for processing and displays the predicted fish species to the user.

## Features
- Capture Photo: Users can capture a photo of a fish using the device's camera.
- Predict Fish Species: The application sends the selected image to the Fishsnap Backend for classification and displays the predicted fish species.
- Fish Filtering: fish filtering as an additional feature for fish enthusiasts.

## Dependencies
Fishsnap Frontend uses the following packages:
- http: For making HTTP requests to the Fishsnap Backend.
- image_picker: For capturing photos from the camera.

These packages are automatically installed when you run flutter ```pub get to install``` dependencies.






