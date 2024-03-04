import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({
    super.key,
    required this.normalText,
    required this.coloredText,
    required this.callback,
  });

  final String normalText;
  final String coloredText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText,
            style: TextStyles.font12GreyMedium,
          ),
          TextSpan(
            text: coloredText,
            style: TextStyles.font12GreyMedium.copyWith(
              color: ColorsManager.mainColor,
              decorationColor: ColorsManager.mainColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                callback();
              },
          ),
        ],
      ),
    );
  }
}
