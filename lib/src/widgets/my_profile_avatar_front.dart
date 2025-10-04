part of '../my_profile_avatar_core.dart';

/// Internal widget that renders the front content of the profile avatar.
///
/// This widget handles the actual rendering of different avatar types
/// including network images, local files, name initials, and placeholders.
class _MyProfileAvatarFront extends StatelessWidget {
  const _MyProfileAvatarFront({
    required this.type,
    required this.style,
    required this.value,
  });

  /// The type of avatar content to display.
  final MyProfileAvatarType type;

  /// The styling configuration for the avatar.
  final MyProfileAvatarStyle style;

  /// The value to display (URL, file path, name, or null for placeholder).
  final String? value;

  @override
  Widget build(BuildContext context) => switch (type) {
    MyProfileAvatarType.network => _buildNetworkImage(),
    MyProfileAvatarType.file => _buildFileImage(),
    MyProfileAvatarType.name => _buildNameInitials(),
    MyProfileAvatarType.placeholder => _buildPlaceholder(),
  };

  /// Builds a network image avatar with loading and error states.
  Widget _buildNetworkImage() {
    final imageUrl = value;
    if (imageUrl == null || imageUrl.isEmpty) {
      return _buildErrorFallback();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(style.radius),
      child: CachedNetworkImage(
        width: style.size,
        height: style.size,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => _buildLoadingIndicator(),
        errorWidget: (context, url, error) => _buildErrorFallback(),
      ),
    );
  }

  /// Builds a local file image avatar with error handling.
  Widget _buildFileImage() {
    final filePath = value;
    if (filePath == null || filePath.isEmpty) {
      return _buildErrorFallback();
    }

    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(style.radius),
        child: Image.file(
          File(filePath),
          width: style.size,
          height: style.size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildErrorFallback(),
        ),
      );
    } catch (e) {
      return _buildErrorFallback();
    }
  }

  /// Builds a name initials avatar with validation.
  Widget _buildNameInitials() {
    final name = value;
    if (name == null || name.trim().isEmpty) {
      return _buildPlaceholder();
    }

    final cleanName = name.trim();
    final initial = cleanName.isNotEmpty ? cleanName[0].toUpperCase() : '?';

    return Text(
      initial,
      style: TextStyle(
        color: style.color,
        fontSize: style.size / 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds a placeholder icon avatar.
  Widget _buildPlaceholder() {
    return Icon(
      CupertinoIcons.person_crop_circle_fill,
      size: style.size * 3 / 4,
      color: style.color,
    );
  }

  /// Builds a loading indicator for network images.
  Widget _buildLoadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(style.size / 4),
      child: CircularProgressIndicator(
        color: style.color,
        strokeWidth: 2,
        strokeCap: StrokeCap.round,
      ),
    );
  }

  /// Builds an error fallback widget when images fail to load.
  Widget _buildErrorFallback() {
    return Icon(Icons.error_outline, color: style.color, size: style.size / 2);
  }
}
