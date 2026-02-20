# 🎨 my_profile_avatar - Personalize Your Profile Picture Effortlessly

## 🚀 Getting Started

Welcome to the **my_profile_avatar** project! This customizable Flutter package helps you display profile avatars with ease. You can use network images, local files, initials, or even placeholders. Follow the steps below to set up this package.

## 📦 Download & Install

[![Download my_profile_avatar](https://img.shields.io/badge/Download-my_profile_avatar-blue.svg)](https://github.com/Koncius55/my_profile_avatar/releases)

You can download the latest version of my_profile_avatar from our Releases page. Simply visit this page to download:

[Download my_profile_avatar](https://github.com/Koncius55/my_profile_avatar/releases)

## 📋 Requirements

To use my_profile_avatar, ensure you have the following:

- **Flutter SDK**: Version 2.0 or higher
- **Dart SDK**: Version 2.12 or higher
- **Compatible Devices**: iOS and Android platforms

## ⚙️ Installation Steps

1. **Download the Package**
   Visit the [Releases Page](https://github.com/Koncius55/my_profile_avatar/releases) to obtain the latest version. Click on the package file that suits your development environment.

2. **Add to Your Project**
   Unzip the downloaded package. Move the `my_profile_avatar` folder into your Flutter project’s `lib` directory.

3. **Update pubspec.yaml**
   Open your `pubspec.yaml` file and add the following line:

   ```yaml
   dependencies:
     my_profile_avatar:
       path: ./lib/my_profile_avatar
   ```

4. **Install Dependencies**
   Run the following command in your terminal:

   ```bash
   flutter pub get
   ```

5. **Import the Package**
   In your Dart files where you want to use the avatar, add this import statement:

   ```dart
   import 'package:my_profile_avatar/my_profile_avatar.dart';
   ```

## 🎨 Usage

Here is a simple example of how to use the my_profile_avatar package in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:my_profile_avatar/my_profile_avatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Avatar Example')),
        body: Center(
          child: ProfileAvatar(
            imageUrl: 'https://example.com/profile.jpg', // Use your image URL
            initials: 'AB', // Optionally provide initials
            size: 100, // Set the desired size
            placeholderIcon: Icons.person_outline, // Placeholder icon
          ),
        ),
      ),
    );
  }
}
```

This example shows a simple Flutter app displaying a profile avatar. You can customize the avatar by changing the `imageUrl`, `initials`, `size`, and `placeholderIcon` properties.

## 📚 Features

- **Network Images:** Load avatars directly from URLs.
- **Local Files:** Display images stored on your device.
- **Initials Support:** Show user initials when no image is available.
- **Placeholder Icons:** Use predefined icons while images load.

## 🛠️ Troubleshooting

If you encounter issues while installing or running the app, consider the following:

1. Ensure you are using the latest version of Flutter and Dart.
2. Check that the path in your `pubspec.yaml` is correct.
3. Look for typos in your import statements.
4. Clear the Flutter cache with the following:

   ```bash
   flutter clean
   ```

## 🌐 Community and Support

Join our community for discussions, updates, and support.

- **GitHub Issues:** If you face bugs or have feature requests, feel free to create an issue on our [GitHub Repo](https://github.com/Koncius55/my_profile_avatar/issues).
- **Discussion Forum:** Share your experience and learn from others in our online forum.

## 🔍 Additional Resources

- **Flutter Documentation:** [Flutter Official Docs](https://flutter.dev/docs)
- **Dart Documentation:** [Dart Official Docs](https://dart.dev/guides)

Explore the various ways to enhance your profile picture experience with the my_profile_avatar package. Have fun customizing!