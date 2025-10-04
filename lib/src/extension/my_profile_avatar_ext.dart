import 'package:my_profile_avatar/my_profile_avatar.dart';

/// Extension methods for [MyProfileAvatar] to provide additional functionality.
///
/// This extension adds utility methods to determine the avatar type and
/// extract the appropriate value based on the avatar's configuration.
extension MyProfileAvatarExt on MyProfileAvatar {
  /// Determines the type of avatar content based on the provided parameters.
  ///
  /// This method analyzes the avatar's properties and returns the appropriate
  /// [MyProfileAvatarType] based on the following priority order:
  /// 1. [MyProfileAvatarType.file] - if [pathImage] is not null
  /// 2. [MyProfileAvatarType.network] - if [urlImage] is not null
  /// 3. [MyProfileAvatarType.name] - if [name] is not null
  /// 4. [MyProfileAvatarType.placeholder] - if no other content is available
  ///
  /// ## Example
  ///
  /// ```dart
  /// final avatar = MyProfileAvatar(
  ///   style: MyProfileAvatarStyle(color: Colors.blue),
  ///   urlImage: 'https://example.com/avatar.jpg',
  /// );
  ///
  /// print(avatar.getType()); // MyProfileAvatarType.network
  /// ```
  ///
  /// Returns the [MyProfileAvatarType] that should be used for rendering.
  MyProfileAvatarType getType() {
    if (pathImage != null) {
      return MyProfileAvatarType.file;
    } else {
      if (urlImage != null) {
        return MyProfileAvatarType.network;
      } else {
        if (name != null) {
          return MyProfileAvatarType.name;
        } else {
          return MyProfileAvatarType.placeholder;
        }
      }
    }
  }

  /// Extracts the appropriate value based on the avatar's determined type.
  ///
  /// This method returns the content value that corresponds to the avatar's
  /// current type as determined by [getType()]:
  /// - For [MyProfileAvatarType.network]: returns [urlImage]
  /// - For [MyProfileAvatarType.file]: returns [pathImage]
  /// - For [MyProfileAvatarType.name]: returns [name]
  /// - For [MyProfileAvatarType.placeholder]: returns null
  ///
  /// ## Example
  ///
  /// ```dart
  /// final avatar = MyProfileAvatar(
  ///   style: MyProfileAvatarStyle(color: Colors.blue),
  ///   name: 'John Doe',
  /// );
  ///
  /// print(avatar.getValue()); // 'John Doe'
  /// ```
  ///
  /// Returns the string value for the current avatar type, or null for placeholder.
  String? getValue() => switch (getType()) {
    MyProfileAvatarType.network => urlImage,
    MyProfileAvatarType.file => pathImage,
    MyProfileAvatarType.name => name,
    MyProfileAvatarType.placeholder => null,
  };
}
