import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_button.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';

import '../../../../core/constant/assetsHelper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: StringHelper.getS,
                height: DimensionHelper.dimens_70,
                width: DimensionHelper.dimens_300.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
