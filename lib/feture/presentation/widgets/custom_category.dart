import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';

class CustomCategory extends StatelessWidget {
  final String? name;
   int ?cIndex;
   int ? index;
  final VoidCallback ? callback;
  final String? image;
   CustomCategory({super.key, this.name, this.image, this.callback,this.cIndex,this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(DimensionHelper.dimens_10.sp),
        margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_8.h),
        width: AHelperFunction.screenSize(context).width * .33,
        height: AHelperFunction.screenSize(context).height * .1,
        decoration: BoxDecoration(
          color: cIndex == index?Colors.red:Colors.grey,
          borderRadius: BorderRadius.circular(DimensionHelper.dimens_40)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image??'',height: 60,width: 60,),
            SizedBox(width: DimensionHelper.dimens_10.sp,),
            CustomText(
              text: name,
              fontsize: DimensionHelper.dimens_26,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
