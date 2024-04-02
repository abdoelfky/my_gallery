import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/auth/presentation/controller/login_controller/login_cubit.dart';
import 'package:my_gallery/home/presentation/controller/login_controller/home_cubit.dart';
import 'package:my_gallery/shared/bloc_observer.dart';
import 'package:my_gallery/shared/local/shared_preference.dart';
import 'package:my_gallery/shared/network/dio_helper.dart';
import 'package:my_gallery/shared/resources/app_strings.dart';
import 'package:my_gallery/shared/resources/routes_manager.dart';
import 'package:my_gallery/shared/resources/theme_manager.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (BuildContext context) =>LoginCubit()),
          BlocProvider(create: (BuildContext context) =>HomeCubit()),



        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: lightTheme,
          title: AppStrings.appTitle,
        )
    );

  }
}

