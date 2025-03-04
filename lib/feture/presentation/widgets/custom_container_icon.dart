import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';

class CustomContainerIcon extends StatelessWidget {
  final IconData ?iconData;
  final Color ?color;
  final VoidCallback ?callback;
  final bool isCircle;
  final AlignmentGeometry ?alignment;
  final BoxShape ?boxShape;
  const CustomContainerIcon({
    super.key, this.iconData, this.callback, this.alignment, this.color = ColorsHelper.redColor, this.boxShape,  this.isCircle = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DimensionHelper.dimens_15),
      child: InkWell(
        onTap: callback,
        child: Container(
          height: DimensionHelper.dimens_50.h,
          width: DimensionHelper.dimens_80.w,
          alignment: alignment,
          padding: EdgeInsets.all(DimensionHelper.dimens_15.sp),
          decoration: BoxDecoration(
            color: color,
            //borderRadius: BorderRadius.circular(DimensionHelper.dimens_15.r),
            shape:isCircle? boxShape??BoxShape.circle:BoxShape.rectangle
          ),
          child: Center(child: Icon(iconData,size: DimensionHelper.dimens_40.sp,color: ColorsHelper.whiteColor,),),
        ),
      ),
    );
  }
}
