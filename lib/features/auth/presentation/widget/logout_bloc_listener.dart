import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/core/helpers/extensions.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is LogoutSuccess ||
          current is AuthError,
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            // barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: ColorsManager.mainColor),
            ),
          );
        } else if (state is LogoutSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.loginScreen,
              predicate: (Route<dynamic> route) => false);
          // context.pushNamed(Routes.homeScreen);
        } else if (state is AuthError) {
          debugPrint(state.message);
          setupErrorState(context, state.message);
        } else {
          setupErrorState(context, '');
        }
      },
      child: Container(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15BlackMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
