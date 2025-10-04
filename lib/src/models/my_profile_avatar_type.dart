/// Defines the different types of content that can be displayed in a profile avatar.
///
/// This enum represents the various modes in which [MyProfileAvatar] can operate,
/// each corresponding to a different source or type of avatar content.
///
/// The avatar widget automatically determines which type to use based on the
/// provided parameters, following this priority order:
/// 1. [file] - Local file image (highest priority)
/// 2. [network] - Network image URL
/// 3. [name] - Name initials
/// 4. [placeholder] - Default placeholder icon (lowest priority)
///
/// ## Usage
///
/// This enum is primarily used internally by the avatar widget to determine
/// how to render the content, but it can also be used with the
/// [MyProfileAvatar.type] factory constructor for explicit type specification.
///
/// ```dart
/// // Explicit type specification
/// MyProfileAvatar.type(
///   type: MyProfileAvatarType.network,
///   value: 'https://example.com/avatar.jpg',
///   style: MyProfileAvatarStyle(color: Colors.blue),
/// )
/// ```
enum MyProfileAvatarType {
  /// Displays a default placeholder icon.
  ///
  /// This type is used when no other content is available or when
  /// explicitly requested. Shows a person icon as a fallback.
  placeholder,

  /// Displays an image loaded from a network URL.
  ///
  /// This type loads and caches images from network URLs.
  /// Includes loading indicators and error handling.
  network,

  /// Displays an image loaded from a local file.
  ///
  /// This type loads images from the device's local file system.
  /// Has the highest priority when multiple content types are provided.
  file,

  /// Displays the first letter of a name as text.
  ///
  /// This type shows the uppercase first character of the provided name
  /// as a text-based avatar with the configured styling.
  name,
}
