import 'package:flutter/material.dart';

/// Defines the visual styling configuration for [MyProfileAvatar] widgets.
///
/// This class encapsulates all the visual properties that can be customized
/// for profile avatars, including size, color, and border radius.
///
/// ## Example Usage
///
/// ```dart
/// // Create a large, blue, circular avatar
/// MyProfileAvatarStyle(
///   size: 100,
///   color: Colors.blue,
///   radius: 50, // Fully circular
/// )
///
/// // Create a small, green, square avatar
/// MyProfileAvatarStyle(
///   size: 40,
///   color: Colors.green,
///   radius: 0, // No rounding (square)
/// )
///
/// // Create a medium, red, rounded square avatar
/// MyProfileAvatarStyle(
///   size: 60,
///   color: Colors.red,
///   radius: 12, // Slightly rounded corners
/// )
/// ```
class MyProfileAvatarStyle {
  /// The width and height of the avatar in logical pixels.
  ///
  /// This determines both the width and height of the avatar container,
  /// creating a square aspect ratio. The default value is 50.0.
  ///
  /// Must be a positive value.
  final double size;

  /// The primary color used for various avatar elements.
  ///
  /// This color is used for:
  /// - Text color when displaying name initials
  /// - Loading indicator color for network images
  /// - Error icon color when image loading fails
  /// - Placeholder icon color
  /// - Background color (with reduced opacity)
  ///
  /// This parameter is required and has no default value.
  final Color color;

  /// The border radius for rounding the avatar corners.
  ///
  /// A value of 0 creates a square avatar, while a value equal to
  /// half the [size] creates a perfect circle. Values in between
  /// create rounded rectangles.
  ///
  /// The default value is 100.0, which typically creates circular
  /// avatars for most common sizes.
  ///
  /// Must be a non-negative value.
  final double radius;

  /// Creates a new avatar style configuration.
  ///
  /// The [color] parameter is required as it defines the primary
  /// color scheme for the avatar.
  ///
  /// The [size] defaults to 50.0 logical pixels, creating a medium-sized avatar.
  /// Must be a positive value.
  ///
  /// The [radius] defaults to 100.0, which typically creates circular avatars
  /// for most common sizes. For a perfect circle, set this to half of [size].
  /// Must be a non-negative value.
  ///
  /// ## Example
  ///
  /// ```dart
  /// // Basic usage with required color
  /// MyProfileAvatarStyle(color: Colors.blue)
  ///
  /// // Custom size and radius
  /// MyProfileAvatarStyle(
  ///   color: Colors.green,
  ///   size: 80,
  ///   radius: 40, // Perfect circle
  /// )
  /// ```
  ///
  /// Throws [AssertionError] in debug mode if [size] is not positive
  /// or if [radius] is negative.
  const MyProfileAvatarStyle({
    required this.color,
    this.size = 50,
    this.radius = 100,
  }) : assert(size > 0, 'Size must be positive'),
       assert(radius >= 0, 'Radius must be non-negative');
}
