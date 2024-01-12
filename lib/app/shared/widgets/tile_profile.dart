import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/color.dart';
import 'package:kalorize/app/shared/theme/font.dart';

class ListTileProfile extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  final Color? color;
  final Color? backgroundColor;
  const ListTileProfile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color = mainSecondary,
    this.backgroundColor = backgroundSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: backgroundColor,
        ),
        child: Center(
          child: Image.asset(
            icon,
            width: 20,
            height: 20,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(
        title,
        style: subTitle.copyWith(
          color: color,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: color,
      ),
    );
  }
}
