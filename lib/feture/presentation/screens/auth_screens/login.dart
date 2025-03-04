import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';
import 'package:food_application/core/constant/helper_funcction.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/core/constant/validation.dart';
import 'package:food_application/core/utils/utility.dart';
import 'package:food_application/feture/presentation/blocs/toggle/password_bloc.dart';
import 'package:food_application/feture/presentation/widgets/custom_button.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:food_application/feture/presentation/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailCon;
  late TextEditingController passCon;
  @override
  void initState() {
    emailCon = TextEditingController();
    passCon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AHelperFunction.screenSize(context).height,
        child: Stack(
          children: [
            Container(
              height: AHelperFunction.screenSize(context).height * .4,
              padding: EdgeInsets.only(top: DimensionHelper.dimens_30.sp),
              width: AHelperFunction.screenSize(context).width,
              decoration: BoxDecoration(
                color: Color(0xffffefbf),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(DimensionHelper.dimens_50.r),
                  bottomRight: Radius.circular(DimensionHelper.dimens_50.r),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    AssetsHelper.pan,
                    height: AHelperFunction.screenSize(context).height * .24,
                  ),
                  Image.asset(
                    AssetsHelper.logo,
                    height: AHelperFunction.screenSize(context).height * .09,
                  ),
                ],
              ),
            ),
            Positioned(
              top: AHelperFunction.screenSize(context).height * .35,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: DimensionHelper.dimens_40.sp,
                ),
                height: AHelperFunction.screenSize(context).height * .53,
                width: AHelperFunction.screenSize(context).width,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(
                    DimensionHelper.dimens_40.r,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(DimensionHelper.dimens_30.r),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(
                        DimensionHelper.dimens_40.r,
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            alignment: Alignment.center,
                            text: StringHelper.bSignIn,
                            fontsize: DimensionHelper.dimens_45.sp,
                          ),
                          SizedBox(height: DimensionHelper.dimens_20.h),
                          CustomText(
                            alignment: Alignment.centerLeft,
                            text: StringHelper.eLevel,
                            fontsize: FontHelper.font_34,
                          ),
                          SizedBox(height: DimensionHelper.dimens_10.h),
                          CustomTextfield(
                            controller: emailCon,
                            inputType: TextInputType.emailAddress,
                            preIcon: Icons.mail,
                            hintText: "Enter Your Email",
                            validatore: (value) {
                              return AValidator.validateEmail(value);
                            },
                          ),

                          SizedBox(height: DimensionHelper.dimens_20.h),
                          CustomText(
                            alignment: Alignment.centerLeft,
                            text: StringHelper.pLevel,
                            fontsize: FontHelper.font_34,
                          ),
                          SizedBox(height: DimensionHelper.dimens_10.h),
                          BlocBuilder<PasswordBloc, PasswordToggleState>(
                            builder: (context, state) {
                              return CustomTextfield(
                                hide: state.obscure,
                                controller: passCon,
                                inputType: TextInputType.number,
                                preIcon: Iconsax.check,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context.read<PasswordBloc>().add(PasswordToggleEvent());
                                  },
                                  icon: Icon(
                                    size: DimensionHelper.dimens_40,
                                     color: Colors.black,
                                     state.obscure? Iconsax.eye_slash:Iconsax.eye
                                  ),
                                ),
                                hintText: "Enter Your Password",
                                validatore: (value) {
                                  return AValidator.validatePassword(value);
                                },
                              );
                            },
                          ),
                          SizedBox(height: DimensionHelper.dimens_20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                StringHelper.fP,
                                style: TextStyle(
                                  fontSize: FontHelper.font_28,
                                  color: ColorsHelper.nBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: DimensionHelper.dimens_30.h),
                          CustomButton(
                            height: DimensionHelper.dimens_60.h,
                            width: DimensionHelper.dimens_300.w,
                            color: ColorsHelper.nBlue,
                            text: StringHelper.login,
                            cText: true,
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                Utils().toastMessage("Data Processing");
                              }
                            },
                          ),
                          SizedBox(height: DimensionHelper.dimens_30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: StringHelper.dA),
                              SizedBox(width: DimensionHelper.dimens_4.w),
                              CustomText(
                                color: ColorsHelper.nBlue,
                                callback: () {
                                  context.go("/signin");
                                },
                                fontsize: FontHelper.font_30,
                                text: StringHelper.bSignUp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
