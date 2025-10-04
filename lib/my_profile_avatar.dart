/// A Flutter package for displaying customizable profile avatars.
///
/// This library provides a flexible and easy-to-use widget for displaying
/// profile avatars with support for multiple image sources including network
/// images, local files, name initials, and placeholder icons.
///
/// ## Features
///
/// - **Network Images**: Display avatars from URLs with caching support
/// - **Local Files**: Load avatar images from device storage
/// - **Name Initials**: Generate avatars from user names showing initials
/// - **Placeholder Icons**: Show default avatar icons when no image is available
/// - **Customizable Styling**: Control size, colors, and border radius
/// - **Loading States**: Built-in loading indicators for network images
/// - **Error Handling**: Graceful fallbacks when images fail to load
///
/// ## Usage
///
/// ```dart
/// // Network image avatar
/// MyProfileAvatar(
///   style: MyProfileAvatarStyle(
///     size: 60,
///     color: Colors.blue,
///     radius: 30,
///   ),
///   urlImage: 'https://example.com/avatar.jpg',
/// )
///
/// // Name initials avatar
/// MyProfileAvatar(
///   style: MyProfileAvatarStyle(
///     size: 60,
///     color: Colors.green,
///   ),
///   name: 'John Doe',
/// )
/// ```
library;

export 'src/my_profile_avatar_core.dart';
export 'src/models/my_profile_avatar_style.dart';
export 'src/models/my_profile_avatar_type.dart';
export 'src/extension/my_profile_avatar_ext.dart';
