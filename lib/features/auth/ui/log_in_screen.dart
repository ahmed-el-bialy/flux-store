import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/features/auth/ui/widgets/build_social_button.dart';

import '../../../core/helper/routing_extension.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpacing(10),
                    Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: AppColors.fieldBgGray,
                        borderRadius: BorderRadius.circular(20.r),
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(RouteNames.home, null);
                          },
                          borderRadius: BorderRadius.circular(20.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "Skip",
                              style: AppTextStyles.fontGray14Medium.copyWith(
                                fontSize: 13.sp,
                                color: AppColors.grayText.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpacing(20),
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 70.sp,
                      color: AppColors.blue,
                    ),
                    verticalSpacing(15),
                    Text(
                      "Welcome Back",
                      style: AppTextStyles.fontBlack24Bold.copyWith(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacing(8),
                    Text(
                      "Sign in to continue your shopping journey",
                      style: AppTextStyles.fontGray14Regular.copyWith(
                        color: AppColors.grayText.withValues(alpha: 0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpacing(30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email Address",
                        style: AppTextStyles.fontBlack14SemiBold.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    verticalSpacing(10),
                    AppTextFormField(
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hintText: "fluxstore@example.com",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 20.sp,
                        color: AppColors.grayText.withValues(alpha: 0.6),
                      ),
                    ),
                    verticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Password",
                          style: AppTextStyles.fontBlack14SemiBold.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot?",
                            style: AppTextStyles.fontBlue14Medium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(10),
                    AppTextFormField(
                      controller: passwordController,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      hintText: "********",
                      isObscureText: isObscure,
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 20.sp,
                        color: AppColors.grayText.withValues(alpha: 0.6),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20.sp,
                          color: AppColors.grayText.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                    verticalSpacing(38),
                    AppTextButton(
                      buttonText: "Login",
                      borderRadius: 25.r,
                      textStyle: AppTextStyles.fontWhite16Bold,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    verticalSpacing(35),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.borderGray.withValues(alpha: 0.5),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: AppTextStyles.fontBlue11Bold.copyWith(
                              fontSize: 11.sp,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.borderGray.withValues(alpha: 0.5),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildSocialButton(
                          logoPath: "assets/images/google_logo.png",
                          backgroundColor: AppColors.fieldBgGray,
                          onTap: () {},
                        ),
                        BuildSocialButton(
                          logoPath: "assets/images/facebook_logo.png",
                          backgroundColor: AppColors.fieldBgGray,
                          onTap: () {},
                        ),
                        BuildSocialButton(
                          logoPath: "assets/images/apple_logo.png",
                          backgroundColor: AppColors.fieldBgGray,
                          onTap: () {},
                        ),
                      ],
                    ),
                    verticalSpacing(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyles.fontGray14Medium.copyWith(
                            color: AppColors.grayText.withValues(alpha: 0.8),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(RouteNames.signUp, null);
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyles.fontBlue14Medium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
