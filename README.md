# G-Sneaker

- Watch the video -> Resources/screen-recording.mp4

![Screenshot](resources/screenshot.jpeg)

## Prerequisites

- Flutter 3.10.x
- Android Studio - [latest version](https://developer.android.com/studio/install?gclid=Cj0KCQjwiIOmBhDjARIsAP6YhSWAACh94FR8rU7TUR5My3O9zfbvsdcwq3MuupLn6QDGX5KUDQAv_l0aAjg1EALw_wcB&gclsrc=aw.ds)
- MacOS & XCode (for build & debug iOS)

## How to Use

**Step 1:** Download or clone this repo by using the link below:

```
https://github.com/j1mmyto9/flutter-demo-gsneaker.git
```

**Step 2:** Install Flutter

- Install the platform-specific SDK [here](https://flutter.dev/docs/get-started/install)

**Step 3:** Setup flutter and run locally
Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

Connect your physical device or open simulator. then run your app

```
flutter run
```

# Code Conventions

- [analysis_options.yaml](analysis_options.yaml)
- [About code analytics flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

  In Flutter, Modularization will be done at a file level. While building widgets, we have to make sure they stay independent and re-usable as maximum. Ideally, widgets should be easily extractable into an independent project.

# Dependencies

## State Management

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) A dart package that helps implement the BLoC pattern. Learn more at [bloclibrary.dev](https://bloclibrary.dev/#/)!
