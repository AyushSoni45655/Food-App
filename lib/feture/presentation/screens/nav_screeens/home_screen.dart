// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_application/core/constant/assetsHelper.dart';
// import 'package:food_application/core/constant/dimensionHelper.dart';
// import 'package:food_application/core/constant/stringHelper.dart';
// import 'package:food_application/core/utils/utility.dart';
// import 'package:food_application/feture/presentation/blocs/firedata/firebasedata_bloc.dart';
// import 'package:food_application/feture/presentation/widgets/custom_Listviewbuilder.dart';
// import 'package:food_application/feture/presentation/widgets/custom_category.dart';
// import 'package:food_application/feture/presentation/widgets/custom_gridview.dart';
// import 'package:food_application/feture/presentation/widgets/custom_search.dart';
// import 'package:food_application/feture/presentation/widgets/custom_single_food.dart';
// import 'package:food_application/feture/presentation/widgets/custom_text.dart';
// import 'package:go_router/go_router.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//    int cIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(padding: EdgeInsets.all(DimensionHelper.dimens_30),child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.asset(AssetsHelper.logo,height: DimensionHelper.dimens_70.h,width: DimensionHelper.dimens_150,fit: BoxFit.contain,),
//                     CustomText(text: StringHelper.orderFF,color: Colors.grey.shade500,)
//                   ],
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
//                   child: Image.asset(AssetsHelper.boy,height: DimensionHelper.dimens_90),
//                 )
//               ],
//             ),
//             SizedBox(height: DimensionHelper.dimens_20.h,),
//             CustomSearch(
//               callback: () {
//               },
//               hintText: StringHelper.searchYFFH,
//             ),
//             SizedBox(height: DimensionHelper.dimens_24.h,),
//             BlocBuilder<FirebaseDataBloc, FirebaseDataState>(
//               buildWhen: (previous, current) => previous != current,
//   builder: (context, state) {
//     if(state is FirebaseDataLoading){
//       return CircularProgressIndicator(color: Colors.green,);
//     }
//     else if(state is FirebaseDataError){
//        Utils().toastMessage(state.error.toString());
//     }
//     else if(state is FirebaseDataLoaded){
//       return CustomListviewbuilder(
//         height: 80,
//         itemCount: state.category.length,
//         itemBuider: (_,index) {
//           final category = state.category[index];
//           return CustomCategory(
//             index: index,
//             cIndex: cIndex,
//             callback: () {
//               setState(() {
//                 cIndex = index;
//               });
//               context.read<FirebaseDataBloc>().add(FirebaseCategoryDataEvent(id: category.id));
//             },
//             image: category.image.toString(),
//             name: category.name.toString(),
//           );
//         },
//       );
//     }
//     return SizedBox();
//
//   },
// ),
//             SizedBox(height: DimensionHelper.dimens_30.h,),
//             BlocBuilder<FirebaseDataBloc, FirebaseDataState>(
//               buildWhen: (previous, current) => previous!= current,
//   builder: (context, state) {
//     if(state is FirebaseDataLoading){
//       return CircularProgressIndicator(color: Colors.pink,);
//     }
//     else if(state is FirebaseDataError){
//       Utils().toastMessage(state.error.toString());
//     } else if(state is FirebaseCategoryDataLoaded){
//       return CustomGridview(
//         itemCount: state.categoryData.length, itemBuilder: (_, index) {
//           final data = state.categoryData[index];
//         return CustomSingleFood(
//           callback: () {
//             context.go("/details");
//           },
//           image: data.image.toString(),
//           title: data.name.toString(),
//           price: data.price.toString(),
//         );
//       },);
//     }
//     return SizedBox();
//   },
// )
//           ],
//         ),),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/core/utils/utility.dart';
import 'package:food_application/feture/presentation/blocs/firedata/firebasedata_bloc.dart';
import 'package:food_application/feture/presentation/widgets/custom_Listviewbuilder.dart';
import 'package:food_application/feture/presentation/widgets/custom_category.dart';
import 'package:food_application/feture/presentation/widgets/custom_gridview.dart';
import 'package:food_application/feture/presentation/widgets/custom_search.dart';
import 'package:food_application/feture/presentation/widgets/custom_single_food.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entity/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_30),
          child: Column(
            children: [
              // 🟢 Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetsHelper.logo,
                        height: DimensionHelper.dimens_70.h,
                        width: DimensionHelper.dimens_150,
                        fit: BoxFit.contain,
                      ),
                      CustomText(
                        text: StringHelper.orderFF,
                        color: Colors.grey.shade500,
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
                    child: Image.asset(
                      AssetsHelper.boy,
                      height: DimensionHelper.dimens_90,
                    ),
                  )
                ],
              ),
              SizedBox(height: DimensionHelper.dimens_20.h),

              // 🔍 Search Bar
              CustomSearch(
                callback: () {},
                hintText: StringHelper.searchYFFH,
              ),
              SizedBox(height: DimensionHelper.dimens_24.h),

              // 🟡 Category List BlocBuilder
              BlocBuilder<FirebaseDataBloc, FirebaseDataState>(
                buildWhen: (previous, current) =>
                current is FirebaseDataLoaded || current is FirebaseCategoryDataLoaded,
                builder: (context, state) {
                  List<Categoryss> categoryList = [];

                  if (state is FirebaseDataLoaded) {
                    categoryList = state.category;
                  } else if (state is FirebaseCategoryDataLoaded) {
                    categoryList = state.categoryList;
                  }

                  return CustomListviewbuilder(
                    height: 80,
                    itemCount: categoryList.length,
                    itemBuider: (_, index) {
                      final category = categoryList[index];
                      return CustomCategory(
                        index: index,
                        cIndex: cIndex,
                        callback: () {
                          setState(() {
                            cIndex = index;
                          });
                          context.read<FirebaseDataBloc>().add(
                            FirebaseCategoryDataEvent(id: category.id),
                          );
                        },
                        image: category.image.toString(),
                        name: category.name.toString(),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: DimensionHelper.dimens_4.h),

              // 🟠 Category Data (Food Items) BlocBuilder
              BlocBuilder<FirebaseDataBloc, FirebaseDataState>(
                buildWhen: (previous, current) => current is FirebaseCategoryDataLoaded,
                builder: (context, state) {
                  if (state is FirebaseCategoryDataLoaded) {
                    return CustomGridview(
                      itemCount: state.categoryData.length,
                      itemBuilder: (_, index) {
                        final data = state.categoryData[index];
                        return CustomSingleFood(
                          callback: () {
                            context.go("/details",extra: data);
                          },
                          image: data.image.toString(),
                          title: data.name.toString(),
                          price: data.price.toString(),
                        );
                      },
                    );
                  }
                  return Center(child: Text("Select a category to view items"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

