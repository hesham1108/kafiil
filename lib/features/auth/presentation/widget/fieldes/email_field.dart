import 'package:flutter/material.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EmailField extends StatelessWidget {
  final AuthCubit? cubit;
  final String? email;
  const EmailField({super.key, this.cubit, this.email});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: 'Email Address',
      enabled: email == null,
      validator: Validators.emailValidator,
      initialValue: email,
      controller: cubit?.emailController,
    );
  }
}
