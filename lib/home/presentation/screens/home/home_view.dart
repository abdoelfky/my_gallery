import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/home/presentation/components/button_conponent.dart';
import 'package:my_gallery/home/presentation/components/grid_view_component.dart';
import 'package:my_gallery/home/presentation/controller/login_controller/home_cubit.dart';
import 'package:my_gallery/home/presentation/controller/login_controller/home_states.dart';
import 'package:my_gallery/shared/components/screen_background.dart';
import 'package:my_gallery/shared/resources/app_strings.dart';
import 'package:my_gallery/shared/resources/assets_manager.dart';
import 'package:my_gallery/shared/resources/color_manager.dart';
import 'package:my_gallery/shared/resources/constants_manager.dart';
import 'package:my_gallery/shared/resources/font_manager.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        body: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ScreenBackground(
              backGroundAsset: ImageAssets.homeBackground,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Welcome \nMina',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontFamily: FontConstants.fontFamilyBaloo)),
                        const Spacer(),
                        CircleAvatar(
                          radius: AppSize.s40,
                          backgroundColor: Colors.white,
                          backgroundImage: (AppConstants
                                          .userModel?.profilePicturePath !=
                                      null &&
                                  AppConstants.userModel
                                          ?.toString()
                                          .toLowerCase() !=
                                      null)
                              ? NetworkImage(
                                  '${AppConstants.userModel?.profilePicturePath}')
                              : const AssetImage(
                                  ImageAssets.profilePic,
                                ) as ImageProvider,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) / AppSize.s35,
                    ),
                    Row(
                      children: [
                        DynamicButton(
                          name: AppStrings.logOut,
                          firstColor: ColorManager.darkRed,
                          shadowColor: ColorManager.lightRed,
                          endColor: ColorManager.lightRed,
                          icon: ImageAssets.leftArrowIcon,
                        ),
                        const Spacer(),
                        DynamicButton(
                          name: AppStrings.upload,
                          firstColor: ColorManager.darkYellow,
                          shadowColor: ColorManager.lightYellow,
                          endColor: ColorManager.lightYellow,
                          icon: ImageAssets.upArrowIcon,
                        )
                      ],
                    ),
                    GridViewComponent(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
