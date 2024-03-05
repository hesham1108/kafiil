import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/stepper_cubit/stepper_cubit.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperCubit, int>(
      builder: (context, state) {
        return AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          duration: const Duration(milliseconds: 600),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        padding: const EdgeInsets.all(2),
                        color: ColorsManager.mainColor,
                        width: 0.28.sw,
                        height: 3,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        padding: const EdgeInsets.all(2),
                        color: state == 1
                            ? ColorsManager.mainColor
                            : const Color(0XFFE6EAEF),
                        width: 0.36.sw,
                        height: 3,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        padding: const EdgeInsets.all(2),
                        color: state == 2
                            ? ColorsManager.mainColor
                            : const Color(0XFFE6EAEF),
                        width: 0.28.sw,
                        height: 3,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0.22.sw,
                    top: -0.05.sh,
                    child: Column(
                      children: [
                        Text(
                          'Register',
                          style: TextStyles.font12MainColorSemiBold,
                        ),
                        5.verticalSpace,
                        AnimatedContainer(
                          width: 0.09.sw,
                          height: 0.09.sw,
                          duration: const Duration(milliseconds: 600),
                          // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: state == 0
                                ? ColorsManager.white
                                : ColorsManager.mainColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: ColorsManager.mainColor, width: 2),
                          ),
                          child: Center(
                            child: state == 0
                                ? Text(
                                    '1',
                                    style: TextStyles.font12MainColorSemiBold,
                                  )
                                : const Icon(
                                    Icons.done,
                                    color: ColorsManager.white,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0.2.sw,
                    top: -0.05.sh,
                    child: Column(
                      children: [
                        Text(
                          'Complete Data',
                          style: TextStyles.font12MainColorSemiBold.copyWith(
                            color: state < 1
                                ? ColorsManager.grey300
                                : ColorsManager.mainColor,
                          ),
                        ),
                        5.verticalSpace,
                        AnimatedContainer(
                          width: 0.09.sw,
                          height: 0.09.sw,
                          duration: const Duration(milliseconds: 600),
                          // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: state < 1
                                ? const Color(0XFFE6EAEF)
                                : state == 1
                                    ? ColorsManager.white
                                    : ColorsManager.mainColor,
                            shape: BoxShape.circle,
                            border: state >= 1
                                ? Border.all(
                                    color: ColorsManager.mainColor,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: state < 1
                              ? null
                              : Center(
                                  child: state == 1
                                      ? Text(
                                          '2',
                                          style: TextStyles
                                              .font12MainColorSemiBold,
                                        )
                                      : const Icon(
                                          Icons.done,
                                          color: ColorsManager.white,
                                        ),
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
