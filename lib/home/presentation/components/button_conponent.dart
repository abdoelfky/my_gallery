import 'package:flutter/material.dart';
import 'package:my_gallery/shared/resources/app_strings.dart';
import 'package:my_gallery/shared/resources/color_manager.dart';
import 'package:my_gallery/shared/resources/font_manager.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class DynamicButton extends StatelessWidget {
  DynamicButton({
    Key? key,
    required this.name,
    required this.firstColor,
    required this.shadowColor,
    required this.endColor,
    required this.icon,
  }) : super(key: key);

  final String name;
  final Color firstColor;
  final Color shadowColor;
  final Color endColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        children: [
          Container(
            width: mediaQueryWidth(context) / AppSize.s2_5,
            height: mediaQueryHeight(context) / AppSize.s15,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s25)),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Container(
                    width: mediaQueryWidth(context) / AppSize.s10,
                    height: mediaQueryHeight(context) / AppSize.s20,
                    decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                              offset: Offset(-7.0, 0.0),
                              spreadRadius: AppSize.s2,
                              color: shadowColor,
                              blurRadius: AppSize.s15)
                        ],
                        gradient:  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              firstColor,
                              endColor
                            ]),
                        color: ColorManager.red,
                        borderRadius: BorderRadius.circular(AppSize.s15)),
                    child: Image(image: AssetImage(icon),),
                  ),
                  SizedBox(
                    width: mediaQueryWidth(context) / AppSize.s35,
                  ),
                  Text(name,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontFamily: FontConstants.fontFamilyBaloo)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
