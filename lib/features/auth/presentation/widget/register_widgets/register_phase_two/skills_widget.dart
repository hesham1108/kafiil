import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../../core/helpers/spacing.dart';

class SkillsWidget extends StatelessWidget {
  final AuthCubit cubit;
  const SkillsWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills', style: TextStyles.font12GreyMedium),
        verticalSpace(10),
        Container(
          width: 1.sw,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: ColorsManager.grey50,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runSpacing: 10,
            spacing: 10,
            children: [
              Chip(
                label: Text(
                  'test Skill',
                  style: TextStyles.font12MainColorMedium,
                ),
                padding: const EdgeInsets.all(3),
                backgroundColor: ColorsManager.mainColor100,
                deleteIcon: Icon(
                  Icons.clear,
                  size: 0.05.sw,
                ),
                deleteIconColor: ColorsManager.mainColor,
                side: const BorderSide(
                  width: 0,
                  color: ColorsManager.mainColor100,
                ),
                onDeleted: () {
                  print('lol');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
