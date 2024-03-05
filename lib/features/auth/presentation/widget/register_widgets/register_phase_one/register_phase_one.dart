import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/helpers/validators.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/toggle_password_cubit/toggle_password_cubit.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/email_field.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/name_fields.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/password_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_one/user_types_widget.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../logic/stepper_cubit/stepper_cubit.dart';

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
            NameFields(cubit: cubit),
            verticalSpace(18),
            EmailField(cubit: cubit),
            verticalSpace(18),
            PasswordField(cubit: cubit),
            verticalSpace(18),
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
            verticalSpace(18),
            UserTypesWidget(cubit: cubit),
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
