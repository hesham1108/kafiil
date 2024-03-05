import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/core/helpers/spacing.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/helpers/validators.dart';
import '../../logic/toggle_password_cubit/toggle_password_cubit.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authCubit.loginFormKey,
      child: Column(
        children: [
          AppTextFormField(
            backgroundColor: ColorsManager.grey50,
            controller: authCubit.userNameController,
            label: 'Email Address',
            validator: Validators.emailValidator,
          ),
          verticalSpace(16),
          BlocBuilder<TogglePasswordCubit, bool>(
            builder: (context, state) {
              return AppTextFormField(
                controller: authCubit.passwordController,
                isObscureText: !state,
                suffixIcon: GestureDetector(
                  onTap: context.read<TogglePasswordCubit>().toggle,
                  child: Icon(
                    !state
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0XFF8692A6),
                    size: 22,
                  ),
                ),
                validator: Validators.passwordValidator,
                label: 'Password',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.mainColor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
