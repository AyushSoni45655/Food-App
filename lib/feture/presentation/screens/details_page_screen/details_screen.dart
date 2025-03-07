import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';
import 'package:food_application/feture/domain/entity/categorydata.dart';
import 'package:food_application/feture/presentation/widgets/custom_button.dart';
import 'package:food_application/feture/presentation/widgets/custom_container_icon.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatefulWidget {
  final CategoryData categoryData;
  const DetailsScreen({super.key, required this.categoryData});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    final tPrice = value * int.parse(widget.categoryData.price.toString());
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_50)
              ),
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_50.r),
                  child: Image.network(widget.categoryData.image.toString(),fit: BoxFit.cover,width: DimensionHelper.dimens_all,height:AHelperFunction.screenSize(context).height * .27,)),
            ),
            SizedBox(height: DimensionHelper.dimens_20,),
            CustomText(
              text: widget.categoryData.name.toString(),
              fontsize: DimensionHelper.dimens_40,
            ),
            SizedBox(height: DimensionHelper.dimens_10.h,),
                CustomText(
                  text: "\$${widget.categoryData.price.toString()}.00",
                  fontsize: DimensionHelper.dimens_34,
                  color: ColorsHelper.redColor,
                ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
            // CustomText(
            //   textAlign: TextAlign.justify,
            //   fontsize: FontHelper.font_24,
            //   color: Colors.grey.shade700,
            //   text: widget.categoryData.description.toString(),
            // ),
                ReadMoreText(
                  textAlign: TextAlign.justify,
                  widget.categoryData.description.toString(),
                  trimLines: 11, // सिर्फ 2 लाइन दिखेंगी
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  style: TextStyle(
                    fontSize: FontHelper.font_30,  // 🔹 यहाँ Font Size बढ़ाएं
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700
                  ),
                  trimCollapsedText: ' Read More',
                  trimExpandedText: ' Read Less',

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
                  callback: () {
                    setState(() {
                      value = value + 1;;
                    });
                    print(value);
                  },
                  color: ColorsHelper.redColor,
                  iconData: Icons.add,
                  isCircle: false,
                ),
                SizedBox(width: DimensionHelper.dimens_20,),
                CustomText(text: value.toString(),fontsize: FontHelper.font_40,),
                SizedBox(width: DimensionHelper.dimens_20,),
                CustomContainerIcon(
                  callback: () {
                    if(value<=1){
                      return;
                    }else{
                      value = value -1;
                      setState(() {

                      });
                    }
                  },
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
                        text: "\$${tPrice}.00",
                      ),
                    ),
                    SizedBox(width: DimensionHelper.dimens_30.w,),
                    Expanded(
                      flex: 7,
                      child: CustomButton(
                        height: DimensionHelper.dimens_60.h,
                        width: 200,
                        color: Colors.black,
                        text: "\$${tPrice}.00",
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
