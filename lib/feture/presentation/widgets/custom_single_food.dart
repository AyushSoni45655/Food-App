import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';

class CustomSingleFood extends StatelessWidget {
  final String ?image;
  final VoidCallback ?callback;
  final String ?title;
  final String? price;
  CustomSingleFood({super.key, this.image, this.callback, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20.w,vertical: DimensionHelper.dimens_30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
        border: Border.all(color: CupertinoColors.black,width: DimensionHelper.dimens_4.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: DimensionHelper.dimens_20,),
          Image.asset(height: DimensionHelper.dimens_170,width: DimensionHelper.dimens_all,image??'',fit: BoxFit.contain,),
          SizedBox(height: DimensionHelper.dimens_2.h,),
          Padding(
            padding: const EdgeInsets.only(left: DimensionHelper.dimens_20),
            child: CustomText(
              text: title,
              fontsize: FontHelper.font_26.sp,
              color: ColorsHelper.nBlue,
            ),
          ),
          SizedBox(height: DimensionHelper.dimens_4.h,),
          Padding(
            padding: const EdgeInsets.only(left: DimensionHelper.dimens_20),
            child: CustomText(
              text: "\$${price}.00",
              fontsize: FontHelper.font_30.sp,
              color: CupertinoColors.black,
            ),
          ),
          SizedBox(height: DimensionHelper.dimens_4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: callback,
                child: Container(
                  height: DimensionHelper.dimens_75,
                  width: DimensionHelper.dimens_150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(DimensionHelper.dimens_30.r),
                      bottomRight: Radius.circular(DimensionHelper.dimens_26.r)
                    ),
                    color: ColorsHelper.redColor,
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward_rounded,size: 50,color: Colors.white,),
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
