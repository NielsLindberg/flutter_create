# flutter_create

A small 5111 bytes flutter application for the 2019 FlutterCreate challenge.
Developed in Android Studio and tested on Android Emulator & Devices. I don't have access to iOS devices other than the emulator 'iOS rendering platform' to test but I guess it should work.

Because of how well CustomPaint, Gestures and Animations integrate together it has completely changed how I imagine mobile apps. So for this app I knew I wanted to do something fun and creative with the use of CustomPaint, GestureDetectors and Animations. 

## Install

### Using Github
1. Clone the repo: https://github.com/NielsLindberg/flutter_create
3. Cd into the flutter_create directory.
4. Attach Android or iOs device.
5. In bash run: flutter run --release

### Using Zip
1. Download the zipfile: fluttercreate.zip
2. Extract the contents of the zipfile.
3. Cd into the flutter_create directory.
4. Attach Android or iOs device.
5. In bash run: flutter run --release

####
zip_cmd = zip -9 -r --exclude=*.git* --exclude=*.iml* flutter_create.zip .