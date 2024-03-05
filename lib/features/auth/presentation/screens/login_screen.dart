import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/helpers/extensions.dart';
import 'package:kafiil/core/helpers/spacing.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/core/widgets/app_text_button.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/widget/dont_have_account_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/login_bloc_listener.dart';
import 'package:kafiil/features/auth/presentation/widget/login_widgets/login_form_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/custom_check_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Account Login',
          style: TextStyles.font18BlackSimiBold,
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).popUntil((route) => true),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.035.sw),
            child: SvgPicture.asset(
              'assets/icons/back_button_icon.svg',
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(17.h),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset('assets/images/login.svg'),
              ),
              LoginFormWidget(
                authCubit: context.read<AuthCubit>(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const RememberMe(),
                  CustomCheckBox(
                    title: 'Remember me',
                    remember: true,
                    cubit: context.read<AuthCubit>(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 2.w),
                    child: GestureDetector(
                      child: Text(
                        'Forget password ?',
                        style: TextStyles.font12GreyMedium,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              AppTextButton(
                buttonText: 'Login',
                backgroundColor: ColorsManager.mainColor,
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () async {
                  await validateThenDoLogin(context);
                },
              ),
              verticalSpace(16),
              DontHaveAccountText(
                normalText: 'Don\'t have an account ?',
                coloredText: ' Register',
                callback: () {
                  context.pushNamed(Routes.signupScreen);
                },
              ),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateThenDoLogin(BuildContext context) async {
    if (context.read<AuthCubit>().loginFormKey.currentState!.validate()) {
      await context.read<AuthCubit>().login();
    }
  }
}
