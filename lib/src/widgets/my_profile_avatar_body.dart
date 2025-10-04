part of '../my_profile_avatar_core.dart';

class _MyProfileAvatarBody extends StatelessWidget {
  const _MyProfileAvatarBody({required this.style, required this.avatar});
  final MyProfileAvatar avatar;
  final MyProfileAvatarStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: style.size,
      height: style.size,
      decoration: BoxDecoration(
        color: style.color.withAlpha(50),
        borderRadius: BorderRadius.circular(style.radius),
      ),
      child: _MyProfileAvatarFront(
        style: style,
        type: avatar.getType(),
        value: avatar.getValue(),
      ),
    );
  }
}
