# Cat Breeds APP

_The present repository is an implementation and use of the TheCatAPI (https://api.thecatapi.com)_

## Start 🚀

For run this project you need to download this repo:

### Pre-requisites 📋

_What things do you need to install the software and how to install them:_

- Install Flutter on your machine: https://docs.flutter.dev/get-started/install. It's important to follow all the steps depending on the machine you are using. It's preferable to use a Mac so that the application can be tested on both iOS and Android.
- Install melos on your machine: https://invertase.docs.page/melos/getting-started.

- Set up an editor: https://docs.flutter.dev/get-started/editor. We recommend using VSCode.

### Installation 🔧

_Steps for debug the app_

0. Copy the api_keys_example.json, an create a file with the name api_keys.json, and add the apiKey to use thecatapi.

1. Check that the Flutter version is 3.24.2 or similar compatible

2. Run this command

```
melos bs
```

3. Run this commands (only for MAC)

```
cd ios
pod cache clean --all
pod repo update
pod install
pod update
```

4. Run and IOS or Android Emulator and play the debug mode

#### If you are using VSCODE and running the "run and debug" command:

_In the .vscode folder, you will find different launch configurations for the app_

#### For other text editors, please refer to these documents:

- Flutter documentation for Android Studio: https://docs.flutter.dev/tools/android-studio#running-and-debugging
- Android documentation for configuring different builds: https://developer.android.com/studio/run/rundebugconfig

1. Run:

   If you want an apk file

```
melos run build:android-apk
```

2. Run:

   If you want a bundle file

```
melos run build:android-bundle
```

#### IOS (Only works MAC)

2. Ejecutar:

```
melos run build:ios
```

## Built with

- Flutter 3.24.2
- Dart 3.5.2

_Libraries used in the project_

### Dependencies

- [dio](https://pub.dev/packages/dio): A package for making HTTP requests, essential for fetch the api data.
- [json_annotation](https://pub.dev/packages/json_annotation): A package for automatically generating JSON serialization code for your Dart classes. It simplifies the process of converting JSON data to Dart objects and vice versa.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): For provide the blocs in the app and to use useful widgets to listen changes in the state of the blocs
- [bloc_concurrency](https://pub.dev/packages/bloc_concurrency): Using in the search feature to cancel events while the app is already processing a search
- [equatable](https://pub.dev/packages/equatable): For implement equalities in classes (used mostly for the bloc states)
- [json_serializable](https://pub.dev/packages/google_fonts): For create the fromJson in models data
- [build_runner](https://pub.dev/packages/google_fonts): Used for run the json_serializable and retrofit commands
- [very_good_analysis](https://pub.dev/packages/very_good_analysis): Used for static analysis in the app

## Authors ✒️

- **Jairo Andrés Portela Cortés**
