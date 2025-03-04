import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_button.dart';
import 'package:food_application/feture/presentation/widgets/custom_container_icon.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: DimensionHelper.dimens_20,),
            CustomContainerIcon(
              callback: () {
                context.go("/nav");
              },
              color: ColorsHelper.redColor,
              iconData: Icons.arrow_back,
              boxShape: BoxShape.circle,
            ),
            SizedBox(height: DimensionHelper.dimens_10.h,),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: Alignment.centerLeft,
              child: Image.asset(AssetsHelper.pizz1),
            ),
            CustomText(
              text: "Cheese Pizza",
              fontsize: DimensionHelper.dimens_40,
            ),
            SizedBox(height: DimensionHelper.dimens_10.h,),
                CustomText(
                  text: "\$${436}.00",
                  fontsize: DimensionHelper.dimens_34,
                  color: ColorsHelper.redColor,
                ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
            CustomText(
              textAlign: TextAlign.justify,
              fontsize: FontHelper.font_24,
              color: Colors.grey.shade700,
              text: "In Flutter, GoRouter is a modern routing library"
                  " designed to simplify navigation, especially when dealing"
                  " with complex routes or deep linking. It allows you to define"
                  " routes declaratively, making the routing logic more readable"
                  " and manageable, especially in larger applications are the"
                  " manage by.The context.pop() method allows you to pop the"
                  " current route from the navigation stack, essentially taking"
                  " the user back to the previous screen (similar to"
                  " Navigator.pop(context) in traditional Flutter navigation).",
            ),
            SizedBox(height: DimensionHelper.dimens_15.h,),
            CustomText(
              text: "Quantity",
              fontsize: FontHelper.font_40.sp,
            ),
            SizedBox(height: DimensionHelper.dimens_10.h,),
            Row(
              children: [
                CustomContainerIcon(
                  color: ColorsHelper.redColor,
                  iconData: Icons.add,
                  isCircle: false,
                ),
                SizedBox(width: DimensionHelper.dimens_20,),
                CustomText(text: "0",fontsize: FontHelper.font_40,),
                SizedBox(width: DimensionHelper.dimens_20,),
                CustomContainerIcon(
                  color: ColorsHelper.redColor,
                  iconData: Iconsax.minus,
                  isCircle: false,
                ),
              ],
            ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomButton(cText: false,
                        height: DimensionHelper.dimens_60.h,
                        width: 200,
                        color: Colors.black,
                        text: "\$${436}.00",
                      ),
                    ),
                    SizedBox(width: DimensionHelper.dimens_30.w,),
                    Expanded(
                      flex: 7,
                      child: CustomButton(
                        height: DimensionHelper.dimens_60.h,
                        width: 200,
                        color: Colors.black,
                        text: "\$${436}.00",
                      ),
                    )
                  ],
                )

          ]),
        ),
      ),
    );
  }
}
