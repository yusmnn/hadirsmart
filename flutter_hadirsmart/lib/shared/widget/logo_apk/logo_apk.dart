import 'package:flutter/material.dart';

class LogoApk extends StatelessWidget {
  const LogoApk({
    super.key,
    this.width,
    this.height,
    this.icon,
  });

  final double? height;
  final double? width;
  final bool? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: icon == true
          ? Image.asset(
              'assets/icon/icon_hadirsmart.png',
            )
          : Image.asset(
              'assets/icon/icon_text_hadirsmart.png',
            ),
    );
  }
}
