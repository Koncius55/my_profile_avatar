# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-04

### 🎉 Initial Release

This is the first stable release of My Profile Avatar package, providing a comprehensive solution for displaying profile avatars in Flutter applications.

### ✨ Features Added

- **Multiple Avatar Types**: Support for network images, local files, name initials, and placeholder icons
- **Automatic Type Detection**: Smart priority system that automatically selects the best available avatar source
- **Network Image Support**: Built-in caching and loading states using `cached_network_image`
- **Local File Support**: Load images from device storage with error handling
- **Name Initials**: Generate text-based avatars from user names with automatic capitalization
- **Placeholder Icons**: Cupertino-style person icons as fallback
- **Customizable Styling**: Full control over size, colors, and border radius
- **Loading Indicators**: Smooth loading animations for network images
- **Error Handling**: Graceful fallbacks when images fail to load
- **Validation**: Input validation with helpful error messages in debug mode
- **Factory Constructor**: `MyProfileAvatar.type()` for explicit type specification
- **Extension Methods**: Utility methods to determine avatar type and extract values

### 🎨 Styling Options

- Configurable avatar size (width and height)
- Customizable primary color for text, icons, and loading indicators
- Adjustable border radius (from square to perfect circle)
- Background color with automatic opacity adjustment

### 🛡️ Error Handling & Validation

- Null safety throughout the codebase
- Input validation for style parameters
- Graceful error handling for network and file loading failures
- Fallback mechanisms for edge cases (empty names, invalid URLs, etc.)

### 📚 Documentation

- Comprehensive dartdoc comments for all public APIs
- Detailed README with usage examples and API reference
- Code examples for common use cases
- Integration patterns and best practices

### 🔧 Technical Details

- **Minimum Flutter Version**: 1.17.0
- **Minimum Dart SDK**: 3.9.2
- **Dependencies**:
  - `cached_network_image: ^3.4.1` for network image caching
  - Flutter SDK for core functionality
- **Platform Support**: iOS, Android, Web, Desktop

### 📋 API Reference

#### Classes

- `MyProfileAvatar`: Main widget class
- `MyProfileAvatarStyle`: Styling configuration
- `MyProfileAvatarType`: Enum for avatar types
- `MyProfileAvatarExt`: Extension methods

#### Priority System

1. Local file images (highest priority)
2. Network images
3. Name initials
4. Placeholder icons (lowest priority)

### 🚀 Getting Started

```yaml
dependencies:
  my_profile_avatar: ^1.0.0
```

```dart
import 'package:my_profile_avatar/my_profile_avatar.dart';

MyProfileAvatar(
  style: MyProfileAvatarStyle(
    size: 60,
    color: Colors.blue,
    radius: 30,
  ),
  urlImage: 'https://example.com/avatar.jpg',
)
```

### 🤝 Contributing

This package is open source and welcomes contributions. Please see the README for contribution guidelines.

### 📄 License

This project is licensed under the MIT License.
