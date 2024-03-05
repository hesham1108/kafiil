import 'package:flutter/material.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/widgets/app_text_form_field.dart';

class SalaryField extends StatelessWidget {
  final AuthCubit? cubit;
  final String? salary;
  const SalaryField({super.key, this.cubit, this.salary});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: 'Salary',
      enabled: salary == null,
      initialValue: salary,
      controller: cubit?.salaryController,
    );
  }
}
