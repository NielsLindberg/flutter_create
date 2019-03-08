# flutter_create

A small 5111 bytes flutter application for the 2019 FlutterCreate challenge.
Developed in Android Studio and tested on Android Emulator & Devices. I don't have access to iOS devices other than the emulator 'iOS rendering platform' to test but I guess it should work.

## Idea
Because of how well CustomPaint, Gestures and Animations integrate together it has completely changed how I imagine mobile apps. So for this app I knew I wanted to do something fun and creative with the use of CustomPaint, GestureDetectors and Animations. The application is a lamp that is designed using CustomPaint. The lamp can be turned on and off by pulling down a hanging cord. When turned on the lamp shines a light onto the ground making some alternating flutter feature text visible. Because the lamp is completely coded it is smoothly adjusted to both drag gestures and animations as well as being responsive to device dimensions. In the bottom is a selectable list of material primary color swatches that can be selected to change the color style of the app.

## Install

### Using Github
1. Clone the repo: https://github.com/NielsLindberg/flutter_create
3. Cd into the flutter_create directory.
4. Attach Android or iOs device.
5. In bash run: flutter run --release

### Using Zip
1. Download the zipfile: flutter_create.zip
2. Extract the contents of the zipfile.
3. Cd into the flutter_create directory.
4. Attach Android or iOs device.
5. In bash run: flutter run --release

####
zip_cmd = zip -9 -r --exclude=*.git* --exclude=*.iml* flutter_create.zip .


####
Created by Niels Lindberg-Poulsen, March 2019