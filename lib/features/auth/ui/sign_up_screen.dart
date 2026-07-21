import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/features/auth/ui/widgets/social_buttons_row.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/helper/validators.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  bool isConfirmObscure = true;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpacing(5),
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 85.sp,
                      color: AppColors.blue,
                    ),
                    verticalSpacing(10),
                    Text(
                      "Create Account",
                      style: AppTextStyles.fontBlack24Bold,
                    ),
                    verticalSpacing(4),
                    Text(
                      "Join the premiere community for shopping lovers.",
                      style: AppTextStyles.fontGray14Regular,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpacing(25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email Address",
                        style: AppTextStyles.fontBlack14SemiBold,
                      ),
                    ),
                    verticalSpacing(8),
                    AppTextFormField(
                      controller: emailController,
                      hintText: AppConstants.emailExample,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 22.sp,
                        color: AppColors.grayText,
                      ),
                      validator: Validators.validateEmail,
                    ),
                    verticalSpacing(12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: AppTextStyles.fontBlack14SemiBold,
                      ),
                    ),
                    verticalSpacing(8),
                    AppTextFormField(
                      controller: passwordController,
                      hintText: AppConstants.signUpPasswordHint,
                      isObscureText: isObscure,
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 22.sp,
                        color: AppColors.grayText,
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
                          size: 22.sp,
                          color: AppColors.grayText,
                        ),
                      ),
                      validator: Validators.validatePassword,
                    ),
                    verticalSpacing(15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: AppTextStyles.fontBlack14SemiBold,
                      ),
                    ),
                    verticalSpacing(8),
                    AppTextFormField(
                      hintText: AppConstants.signUpPasswordHint,
                      isObscureText: isConfirmObscure,
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        size: 22.sp,
                        color: AppColors.grayText,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmObscure = !isConfirmObscure;
                          });
                        },
                        child: Icon(
                          isConfirmObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 22.sp,
                          color: AppColors.grayText,
                        ),
                      ),
                      validator: (value) => Validators.validateConfirmPassword(
                        value,
                        password: passwordController.text,
                      ),
                    ),
                    verticalSpacing(35),
                    AppTextButton(
                      buttonText: "Sign Up",
                      textStyle: AppTextStyles.fontWhite16Bold,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    verticalSpacing(25),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.borderGray,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: AppTextStyles.fontBlue11Bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.borderGray,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(20),

                    SocialButtonsRow(),

                    verticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppTextStyles.fontGray14Medium,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
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
