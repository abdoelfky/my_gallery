import 'package:flutter/material.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class GridViewComponent extends StatelessWidget {
  GridViewComponent({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: AppPadding.p15,
        crossAxisSpacing: AppPadding.p15,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        // Create a grid with 3 columns. If you change the scrollDirection to
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          return Center(
              child: SizedBox(
            width: mediaQueryWidth(context) / AppSize.s1_5,
            height: mediaQueryHeight(context) / AppSize.s8,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s30),
                child: Image.network(
                    images[index],
                  fit: BoxFit.cover,
                )),
          ));
        }),
      ),
    );
  }
}
