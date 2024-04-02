import 'package:flutter/material.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class ScreenBackground extends StatelessWidget {
  final String backGroundAsset;
  const ScreenBackground({super.key,required this.child, required this.backGroundAsset});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryHeight(context),
      width: mediaQueryWidth(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backGroundAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
