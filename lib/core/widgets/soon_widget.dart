import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class SoonWidget extends StatelessWidget {
  const SoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: ColorsManager.mainColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/little_logo.png',
            width: 0.5.sw,
            // height: 50,
          ),
        ),
        Text(
          'Soon',
          style: TextStyle(
            color: ColorsManager.mainColor.withOpacity(0.5),
            fontSize: 19.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
