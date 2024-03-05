import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafiil/core/helpers/extensions.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/stepper_cubit/stepper_cubit.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/custom_stepper.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_one/register_phase_one.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/register_phase_two.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyles.font18BlackSimiBold,
        ),
        leading: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (current, next) =>
              next is AuthPhaseTwo || current is AuthPhaseTwo,
          builder: (context, state) {
            return InkWell(
              onTap: state is AuthPhaseTwo
                  ? () {
                      context.read<AuthCubit>().showPhaseOne();
                      context.read<StepperCubit>().forwardStep(0);
                    }
                  : context.pop,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.035.sw),
                child: SvgPicture.asset(
                  'assets/icons/back_button_icon.svg',
                ),
              ),
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: CustomStepper(),
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.022.sh,
                  horizontal: 0.04.sw,
                ),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AuthLoadData) {
                      return Padding(
                        padding: EdgeInsets.all(0.1.sw),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.mainColor,
                          ),
                        ),
                      );
                    } else if (state is AuthPhaseOne || state is AuthPhaseTwo) {
                      return AnimatedSwitcher(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        reverseDuration: const Duration(
                          milliseconds: 600,
                        ),
                        child: state is AuthPhaseOne
                            ? RegisterPhaseOne(cubit: context.read<AuthCubit>())
                            : RegisterPhaseTwo(
                                cubit: context.read<AuthCubit>()),
                      );
                    } else {
                      return Column(
                        children: [
                          RegisterPhaseOne(
                            cubit: context.read<AuthCubit>(),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
