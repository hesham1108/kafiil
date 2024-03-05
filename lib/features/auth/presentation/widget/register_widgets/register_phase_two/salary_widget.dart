import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/features/auth/presentation/logic/salary_cubit/salary_cubit.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/font_weight_helper.dart';
import '../../../../../../core/theming/styles.dart';

class SalaryWidget extends StatelessWidget {
  SalaryWidget({super.key});

  final SalaryCubit salaryCubit = SalaryCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Salary', style: TextStyles.font12GreyMedium),
        verticalSpace(8),
        BlocProvider.value(
          value: salaryCubit,
          child: BlocBuilder<SalaryCubit, int>(
            builder: (context, state) {
              return Container(
                width: 1.sw,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorsManager.moreLightGray,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        salaryCubit.changeSalary(false, context);
                      },
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Container(
                        width: 0.1.sw,
                        height: 0.1.sw,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsManager.lighterGray,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(2, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/icons/minus.svg')
                          // Text(
                          //   '-',
                          //   style: TextStyles.font12MainColorSemiBold.copyWith(
                          //     fontSize: 25.sp,
                          //     fontWeight: FontWeightHelper.extraBold,
                          //   ),
                          // )
                          ,
                        ),
                      ),
                    ),
                    Text(
                      'SAR $state',
                      style: TextStyles.font16WhiteSemiBold.copyWith(
                        color: ColorsManager.grey800,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        salaryCubit.changeSalary(true, context);
                      },
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Container(
                        width: 0.1.sw,
                        height: 0.1.sw,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsManager.lighterGray,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(2, 1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: ColorsManager.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
