import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/home/presentation/components/button_conponent.dart';
import 'package:my_gallery/home/presentation/controller/alert_controller/alert_cubit.dart';
import 'package:my_gallery/home/presentation/controller/alert_controller/alert_states.dart';
import 'package:my_gallery/home/presentation/controller/home_controller/home_cubit.dart';
import 'package:my_gallery/shared/components/toast_component.dart';
import 'package:my_gallery/shared/resources/app_strings.dart';
import 'package:my_gallery/shared/resources/assets_manager.dart';
import 'package:my_gallery/shared/resources/color_manager.dart';
import 'package:my_gallery/shared/resources/values_manager.dart';

class alertDialog extends StatelessWidget {
  const alertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertCubit,AlertStates>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is UploadImageSuccessState) {
          showToast(text: 'Uploaded Successfully', state: ToastStates.SUCCESS);
          HomeCubit.get(context).fetchData();


        }



      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: ColorManager.white.withOpacity(ColorManager.opacity),
          content: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: AppSize.s10, sigmaY: AppSize.s10),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQueryHeight(context) / AppSize.s35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DynamicButton(
                      baseColor: ColorManager.move,
                      name: AppStrings.gallery,
                      firstColor: ColorManager.move,
                      shadowColor: ColorManager.move,
                      endColor: ColorManager.move,
                      icon: ImageAssets.gallery,
                      onTap: ()=>AlertCubit.get(context).pickMedia(),
                      borderRadius: AppSize.s15,
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) / AppSize.s60,
                    ),
                    DynamicButton(
                      baseColor: ColorManager.move,
                      name: AppStrings.camera,
                      firstColor: ColorManager.move,
                      shadowColor: ColorManager.move,
                      endColor: ColorManager.move,
                      icon: ImageAssets.camera,
                      onTap: ()=>AlertCubit.get(context).pickMediaCamera(),
                      borderRadius: AppSize.s15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
