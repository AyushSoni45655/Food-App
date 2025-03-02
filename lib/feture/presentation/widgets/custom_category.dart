import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_8.h),
      width: AHelperFunction.screenSize(context).width * .33,
      height: AHelperFunction.screenSize(context).height * .1,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(DimensionHelper.dimens_40)
      ),
    );
  }
}
