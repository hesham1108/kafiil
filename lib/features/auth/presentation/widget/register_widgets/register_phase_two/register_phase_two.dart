import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/avatar.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/birth_date_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/salary_widget.dart';

import '../../../logic/cubit/auth_cubit.dart';

class RegisterPhaseTwo extends StatelessWidget {
  final AuthCubit cubit;

  const RegisterPhaseTwo({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.phaseTwoFormKey,
      child: Padding(
        padding: EdgeInsets.only(top: 0.02.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Avatar(),
            AppTextFormField(
              controller: cubit.aboutController,
              maxLines: 4,
              label: 'About',
            ),
            SalaryWidget(),
            BirthDateField(cubit: cubit),
          ],
        ),
      ),
    );
  }
}
