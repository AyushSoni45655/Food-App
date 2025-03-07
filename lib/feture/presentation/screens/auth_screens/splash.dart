import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_button.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assetsHelper.dart';
import '../../blocs/auth/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // hii
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  void _navigate() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      context.read<AuthenticationBloc>().add(isLoggedInEvent());
    } catch (e) {
      debugPrint("Error in  the navigation: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    if(state is AuthLoggedIn){
      context.go("/nav");
    }
    if(state is AuthLoggedOut){
      context.go("/login");
    }
  },
  child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20),
        child: Container(
          width: DimensionHelper.dimens_all,
          child: Column(
            children: [
              Image.asset(AssetsHelper.onboard,height: AHelperFunction.screenSize(context).height * .6,),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomText(
                alignment: Alignment.center,
                text: StringHelper.splashTi,
                color: ColorsHelper.nBlue,
                fontsize: DimensionHelper.dimens_45,
              ),
              SizedBox(height: DimensionHelper.dimens_30.h,),
              CustomText(
                alignment: Alignment.center,
                text: StringHelper.splashST,
                color: Colors.grey,
                fontsize: DimensionHelper.dimens_28,
              ),
              SizedBox(height: DimensionHelper.dimens_50.h,),
              CustomButton(
                callback: () {
                  context.go("/login");
                },
                text: StringHelper.getS,
                height: DimensionHelper.dimens_70,
                width: DimensionHelper.dimens_300.h,
              )
            ],
          ),
        ),
      ),
    ),
);
  }
}
