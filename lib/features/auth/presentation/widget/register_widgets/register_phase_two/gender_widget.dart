import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/stepper_cubit/stepper_cubit.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/custom_radio_button.dart';

class GenderWidget extends StatelessWidget {
  final AuthCubit? cubit;
  final int? selectedIndex;
  GenderWidget({
    super.key,
    this.cubit,
    this.selectedIndex,
  });

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
                  CustomRadioButton(
                    selected:
                        selectedIndex != null ? selectedIndex == 1 : state == 1,
                    label: 'Male',
                    onTap: selectedIndex != null
                        ? null
                        : () {
                            stepper.forwardStep(1);
                            cubit!.setGender(1);
                          },
                  ),
                  horizontalSpace(15),
                  CustomRadioButton(
                    selected:
                        selectedIndex != null ? selectedIndex == 2 : state == 2,
                    label: 'Female',
                    onTap: selectedIndex != null
                        ? null
                        : () {
                            stepper.forwardStep(2);
                            cubit!.setGender(2);
                          },
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
