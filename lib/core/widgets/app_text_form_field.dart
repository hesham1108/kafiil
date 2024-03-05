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
    this.initialValue,
    required this.label,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor = ColorsManager.grey50,
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
  final String? hintText, initialValue;
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
          initialValue: initialValue,
          enabled: initialValue == null,
          cursorHeight: enabled ? null : 0,
          keyboardType: enabled ? null : TextInputType.none,
          showCursor: enabled,
          onTap: onTap,
          enableSuggestions: true,
          controller: initialValue == null ? controller : null,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 18.h,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(width: 0.0, color: backgroundColor!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(width: 0.0, color: backgroundColor!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(width: 0.0, color: backgroundColor!),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(18),
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
