import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.prefixIcon,
    this.inputType,
    this.textInputAction,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      textInputAction: textInputAction,
      controller: controller,

      style: inputTextStyle ?? AppTextStyles.fontBlack14SemiBold,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        filled: true,

        fillColor: backgroundColor ?? AppColors.lightBlue.withValues(alpha: .8),
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        hintText: hintText,

        hintStyle: hintStyle ?? AppTextStyles.fontGray14Medium,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.borderGray, width: 1.2.w),
            ),

        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.focusedBlue,
                width: 1.5.w,
              ),
            ),

        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.redFavorite,
                width: 1.2.w,
              ),
            ),

        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.redFavorite,
                width: 1.5.w,
              ),
            ),
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 12.sp, color: AppColors.redFavorite),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
