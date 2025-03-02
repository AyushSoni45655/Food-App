import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_Listviewbuilder.dart';
import 'package:food_application/feture/presentation/widgets/custom_category.dart';
import 'package:food_application/feture/presentation/widgets/custom_search.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(DimensionHelper.dimens_30),child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsHelper.logo,height: DimensionHelper.dimens_70.h,width: DimensionHelper.dimens_150,fit: BoxFit.contain,),
                  CustomText(text: StringHelper.orderFF,color: Colors.grey.shade500,)
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
                child: Image.asset(AssetsHelper.boy,height: DimensionHelper.dimens_90),
              )
            ],
          ),
          SizedBox(height: DimensionHelper.dimens_20.h,),
          CustomSearch(
            callback: () {

            },
            hintText: StringHelper.searchYFFH,
          ),
          SizedBox(height: DimensionHelper.dimens_14.h,),
          CustomListviewbuilder(
            height: 100,
            itemCount: 10,
            itemBuider: (_,index) {
              return CustomCategory();
            },
          )
        ],
      ),),
    );
  }
}
