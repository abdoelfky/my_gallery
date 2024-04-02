import 'package:flutter/material.dart';
import 'package:my_gallery/shared/resources/assets_manager.dart';
import 'package:my_gallery/shared/resources/color_manager.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class GridViewComponent extends StatelessWidget {
  const GridViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: AppPadding.p15,
        crossAxisSpacing: AppPadding.p15,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
              child: Container(
                width: mediaQueryWidth(context) / AppSize.s1_5,
                height: mediaQueryHeight(context) / AppSize.s8,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s30),
                    child: Image(image: AssetImage(ImageAssets.test,),fit: BoxFit.cover,)),
              ));
        }),
      ),
    );
  }
}
