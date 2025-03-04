import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/feture/presentation/blocs/nav/navigation_bloc.dart';
import 'package:food_application/feture/presentation/blocs/toggle/password_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/constant/routes.dart';
import 'core/theme/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'getit_dependency.dart';
void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: optionss
  // );
  setUpLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.I<NavigationBloc>(),),
    BlocProvider(create: (context) => GetIt.I<PasswordBloc>(),),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          builder: (context, child) {
            return ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),  // Ensure the child is non-null
              maxWidth: 1280,
              minWidth: 640,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(640, name: 'SM'),
                ResponsiveBreakpoint.autoScale(768, name: 'MD'),
                ResponsiveBreakpoint.autoScale(1024, name: 'LG'),
                ResponsiveBreakpoint.autoScale(1280, name: 'XL'),
              ],
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: AAppTheme.darkTheme,
          theme: AAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          routerConfig: appRoutes,
        );

      },
    );
  }
}


