import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/helpers/validators.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/toggle_password_cubit/toggle_password_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../logic/stepper_cubit/stepper_cubit.dart';

class RegisterPhaseOne extends StatelessWidget {
  final AuthCubit cubit;

  RegisterPhaseOne({
    super.key,
    required this.cubit,
  });

  final TogglePasswordCubit pass = TogglePasswordCubit();
  final TogglePasswordCubit confirmPass = TogglePasswordCubit();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.phaseOneFormKey,
      child: Padding(
        padding: EdgeInsets.only(top: 0.02.sh),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: AppTextFormField(
                    label: 'First Name',
                    validator: Validators.firstNameValidator,
                    controller: cubit.nameController,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: AppTextFormField(
                    label: 'Last Name',
                    validator: Validators.lastNameValidator,
                    controller: cubit.nameController,
                  ),
                ),
              ],
            ),
            verticalSpace(18),
            AppTextFormField(
              label: 'Email Address',
              validator: Validators.emailValidator,
              controller: cubit.emailController,
            ),
            verticalSpace(18),
            BlocProvider.value(
              value: pass,
              child: BlocBuilder<TogglePasswordCubit, bool>(
                builder: (context, state) {
                  return AppTextFormField(
                    controller: cubit.signupPasswordController,
                    label: 'Password',
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
            ),
            verticalSpace(18),
            BlocProvider.value(
              value: confirmPass,
              child: BlocBuilder<TogglePasswordCubit, bool>(
                builder: (context, state) {
                  return AppTextFormField(
                    controller: cubit.passwordConfirmationController,
                    label: 'Password Confirmation',
                    isObscureText: !state,
                    suffixIcon: GestureDetector(
                      onTap: confirmPass.toggle,
                      child: Icon(
                        !state ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: Validators.confirmPasswordValidator,
                  );
                },
              ),
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 0.3.sw,
                  child: AppTextButton(
                    buttonText: 'Next',
                    backgroundColor: ColorsManager.mainColor,
                    textStyle: TextStyles.font16WhiteMedium,
                    onPressed: () async {
                      context.read<StepperCubit>().forwardStep(1);
                      context.read<AuthCubit>().showPhaseTwo();
                      await validateThenSignup(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> validateThenSignup(BuildContext context) async {
    if (context.read<AuthCubit>().phaseOneFormKey.currentState!.validate()) {
      await context.read<AuthCubit>().login();
    }
  }
}
