import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../logic/toggle_password_cubit/toggle_password_cubit.dart';

class PasswordField extends StatelessWidget {
  final AuthCubit? cubit;
  final String? password;

  PasswordField({
    super.key,
    this.cubit,
    this.password,
  });
  final TogglePasswordCubit pass = TogglePasswordCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: pass,
      child: BlocBuilder<TogglePasswordCubit, bool>(
        builder: (context, state) {
          return AppTextFormField(
            controller: cubit?.registerPasswordController,
            label: 'Password',
            enabled: password == null,
            initialValue: password,
            isObscureText: !state,
            suffixIcon: GestureDetector(
              onTap: pass.toggle,
              child: Icon(
                !state ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: Validators.passwordValidator,
          );
        },
      ),
    );
  }
}
