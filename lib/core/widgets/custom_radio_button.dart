import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class CustomRadioButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final bool selected;
  const CustomRadioButton({
    super.key,
    required this.selected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    selected ? ColorsManager.mainColor : ColorsManager.grey300,
                width: 3,
              ),
              color: ColorsManager.white,
            ),
            child: Icon(
              Icons.circle_rounded,
              color: selected ? ColorsManager.mainColor : ColorsManager.white,
              size: 0.05.sw,
            ),
          ),
          horizontalSpace(10),
          Text(
            label,
            style: TextStyles.font14BlackMedium,
          ),
        ],
      ),
    );
  }
}
