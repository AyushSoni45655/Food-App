import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';

class CustomSearch extends StatelessWidget {
  final VoidCallback ?callback;
  final TextEditingController ?controller;
  final String?hintText;
   CustomSearch({super.key,  this.controller, this.hintText, this.callback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(DimensionHelper.dimens_10),
          height: DimensionHelper.dimens_60.h,
          width: AHelperFunction.screenSize(context).width * .74,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
          ),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: FontHelper.font_24
            ),
            cursorWidth: 3,
            cursorHeight: DimensionHelper.dimens_30,
            obscureText: false,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade600,
                fontSize: FontHelper.font_22,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
        ),
        InkWell(
          onTap: callback,
          child: Container(
            height: DimensionHelper.dimens_60.h,
            width: DimensionHelper.dimens_80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r),
              color: Colors.red
            ),
            child: Center(child: Icon(Icons.search,size: 60,color: Colors.white,),),
          ),
        )
      ],
    );
  }
}
