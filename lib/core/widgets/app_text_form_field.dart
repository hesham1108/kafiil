import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    required this.label,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor = ColorsManager.mediumGray,
    this.controller,
    this.validator,
    this.maxLines,
    this.onTap,
    this.enabled = true,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder, enabledBorder;
  final TextStyle? inputTextStyle, hintStyle;
  final String label;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final int? maxLines;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font12GreyMedium),
        verticalSpace(8),
        TextFormField(
          // enabled: enabled,
          cursorHeight: enabled ? null : 0,
          keyboardType: enabled ? null : TextInputType.none,
          showCursor: enabled,
          onTap: onTap,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 18.h,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 0.0, color: backgroundColor!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 0.0, color: backgroundColor!),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            hintStyle: hintStyle ?? TextStyles.font14GrayRegular,
            hintText: hintText,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: backgroundColor ?? ColorsManager.moreLightGray,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14BlackMedium,
          validator: validator,
          maxLines: maxLines ?? 1,
        ),
      ],
    );
  }
}
