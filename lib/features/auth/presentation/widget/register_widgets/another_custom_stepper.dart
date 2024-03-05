import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/colors.dart';

class AnotherCustomStepper extends StatelessWidget {
  const AnotherCustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              height: 3,
              color: ColorsManager.mainColor,
            ),
            Container(
              width: 0.09.sw,
              height: 0.09.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.mainColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
