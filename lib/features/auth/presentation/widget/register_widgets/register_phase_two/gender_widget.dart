import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/stepper_cubit/stepper_cubit.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';

class GenderWidget extends StatelessWidget {
  final AuthCubit cubit;

  GenderWidget({super.key, required this.cubit});

  final StepperCubit stepper = StepperCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: stepper,
      child: BlocBuilder<StepperCubit, int>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gender', style: TextStyles.font12GreyMedium),
              verticalSpace(8),
              Row(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      stepper.forwardStep(1);
                      cubit.setGender(1);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: state == 1
                                  ? ColorsManager.mainColor
                                  : ColorsManager.grey300,
                              width: 3,
                            ),
                            color: ColorsManager.white,
                          ),
                          child: Icon(
                            Icons.circle_rounded,
                            color: state == 1
                                ? ColorsManager.mainColor
                                : ColorsManager.white,
                            size: 0.05.sw,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          'Male',
                          style: TextStyles.font14BlackMedium,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(15),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      stepper.forwardStep(2);
                      cubit.setGender(2);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: state == 2
                                  ? ColorsManager.mainColor
                                  : ColorsManager.grey300,
                              width: 3,
                            ),
                            color: ColorsManager.white,
                          ),
                          child: Icon(
                            Icons.circle_rounded,
                            color: state == 2
                                ? ColorsManager.mainColor
                                : ColorsManager.white,
                            size: 0.05.sw,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          'Female',
                          style: TextStyles.font14BlackMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
