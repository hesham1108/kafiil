import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class UserTypesWidget extends StatelessWidget {
  const UserTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Types',
          style: TextStyles.font12GreyMedium,
        ),
        10.verticalSpace,
        const Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [],
        ),
      ],
    );
  }
}
