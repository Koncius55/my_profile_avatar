import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_profile_avatar/src/extension/my_profile_avatar_ext.dart';
import 'package:my_profile_avatar/src/models/my_profile_avatar_style.dart';
import 'package:my_profile_avatar/src/models/my_profile_avatar_type.dart';
part 'widgets/my_profile_avatar_front.dart';
part 'widgets/my_profile_avatar_body.dart';

/// A customizable profile avatar widget that supports multiple display modes.
///
/// This widget can display profile avatars from various sources:
/// - Network images with caching
/// - Local file images
/// - Name initials (first letter of the name)
/// - Placeholder icons
///
/// The widget automatically determines the display mode based on the provided
/// parameters, with the following priority:
/// 1. [pathImage] - Local file image (highest priority)
/// 2. [urlImage] - Network image
/// 3. [name] - Name initials
/// 4. Placeholder icon (lowest priority, used when no other data is provided)
///
/// ## Example Usage
///
/// ```dart
/// // Network image avatar
/// MyProfileAvatar(
///   style: MyProfileAvatarStyle(
///     size: 80,
///     color: Colors.blue,
///     radius: 40,
///   ),
///   urlImage: 'https://example.com/user-avatar.jpg',
/// )
///
/// // Name initials avatar
/// MyProfileAvatar(
///   style: MyProfileAvatarStyle(
///     size: 60,
///     color: Colors.green,
///   ),
///   name: 'Alice Johnson',
/// )
///
/// // Local file avatar
/// MyProfileAvatar(
///   style: MyProfileAvatarStyle(
///     size: 100,
///     color: Colors.purple,
///   ),
///   pathImage: '/path/to/local/image.jpg',
/// )
/// ```
///
/// See also:
/// * [MyProfileAvatarStyle], which defines the visual styling
/// * [MyProfileAvatarType], which defines the different avatar types
/// * [MyProfileAvatar.type], a factory constructor for type-specific creation
class MyProfileAvatar extends StatelessWidget {
  /// Creates a profile avatar widget.
  ///
  /// The [style] parameter is required and defines the visual appearance
  /// of the avatar including size, color, and border radius.
  ///
  /// At least one of [name], [urlImage], or [pathImage] should be provided.
  /// If none are provided, a placeholder icon will be displayed.
  ///
  /// Parameters:
  /// * [style] - Required styling configuration for the avatar
  /// * [name] - Optional name to display as initials
  /// * [urlImage] - Optional URL for network image
  /// * [pathImage] - Optional path to local image file
  /// * [key] - Optional widget key
  const MyProfileAvatar({
    required this.style,
    this.name,
    super.key,
    this.urlImage,
    this.pathImage,
  });

  /// The styling configuration for this avatar.
  ///
  /// Defines the size, color, and border radius of the avatar.
  final MyProfileAvatarStyle style;

  /// The name to display as initials when no image is available.
  ///
  /// When provided, the first letter of the name will be displayed
  /// as a text avatar if no image sources are available.
  /// The letter is automatically converted to uppercase.
  final String? name;

  /// The URL of the network image to display.
  ///
  /// When provided, the avatar will attempt to load and display
  /// this network image with caching support. If loading fails,
  /// an error icon will be shown.
  final String? urlImage;

  /// The local file path of the image to display.
  ///
  /// When provided, the avatar will load and display the image
  /// from the local file system. This has the highest priority
  /// among all image sources.
  final String? pathImage;

  @override
  Widget build(BuildContext context) =>
      _MyProfileAvatarBody(style: style, avatar: this);

  /// Creates a profile avatar widget with a specific type and value.
  ///
  /// This factory constructor provides a more explicit way to create
  /// avatars when you know the specific type of content you want to display.
  ///
  /// The [type] parameter determines how the [value] will be interpreted:
  /// - [MyProfileAvatarType.name]: [value] is treated as a name for initials
  /// - [MyProfileAvatarType.network]: [value] is treated as a network image URL
  /// - [MyProfileAvatarType.file]: [value] is treated as a local file path
  /// - [MyProfileAvatarType.placeholder]: [value] is ignored, shows placeholder
  ///
  /// ## Example Usage
  ///
  /// ```dart
  /// // Create a network image avatar
  /// MyProfileAvatar.type(
  ///   type: MyProfileAvatarType.network,
  ///   value: 'https://example.com/avatar.jpg',
  ///   style: MyProfileAvatarStyle(
  ///     size: 60,
  ///     color: Colors.blue,
  ///   ),
  /// )
  ///
  /// // Create a name initials avatar
  /// MyProfileAvatar.type(
  ///   type: MyProfileAvatarType.name,
  ///   value: 'John Doe',
  ///   style: MyProfileAvatarStyle(
  ///     size: 80,
  ///     color: Colors.green,
  ///   ),
  /// )
  /// ```
  ///
  /// Parameters:
  /// * [type] - The type of avatar content to display
  /// * [value] - The value to use for the specified type
  /// * [style] - The styling configuration for the avatar
  factory MyProfileAvatar.type({
    required MyProfileAvatarType type,
    required String value,
    required MyProfileAvatarStyle style,
  }) {
    return MyProfileAvatar(
      style: style,
      name: type == MyProfileAvatarType.name ? value : null,
      urlImage: type == MyProfileAvatarType.network ? value : null,
      pathImage: type == MyProfileAvatarType.file ? value : null,
    );
  }
}
