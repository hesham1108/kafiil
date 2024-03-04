import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/core/di/dependancy_injection.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/stepper_cubit/stepper_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/toggle_password_cubit/toggle_password_cubit.dart';
import 'package:kafiil/features/home/presentation/screens/home_screen.dart';
import 'package:kafiil/features/splash/presentation/logic/splash_cubit.dart';
import 'package:kafiil/features/splash/presentation/screens/splash_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/logic/navigation/navigation_cubit.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<NavigationCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<StepperCubit>(),
              ),
              // BlocProvider(
              //   create: (context) => getIt<TogglePasswordCubit>(),
              // ),
            ],
            child: const RegisterScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<TogglePasswordCubit>(),
              ),
            ],
            child: const LoginScreen(),
          ),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
