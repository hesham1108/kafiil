import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafiil/core/helpers/local_storage.dart';
import 'package:kafiil/core/networking/dio_factory.dart';
import 'package:kafiil/features/auth/data/web_services/auth_service.dart';
import 'package:kafiil/features/auth/domain/repos/auth_repo.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/salary_cubit/salary_cubit.dart';
import 'package:kafiil/features/auth/presentation/logic/stepper_cubit/stepper_cubit.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/navigation_cubit.dart';
import 'package:kafiil/features/splash/presentation/logic/splash_cubit.dart';

import '../../features/auth/presentation/logic/toggle_password_cubit/toggle_password_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio $ ApiService

  Dio dio = DioFactory.getDio();
  LocalStorage storage = LocalStorage();
  //
  getIt.registerLazySingleton<AuthService>(() => AuthService(dio: dio));
  //
  // //Login
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(authService: getIt()));
  getIt.registerFactory<AuthCubit>(
      () => AuthCubit(authRepo: getIt(), localStorage: storage));
  // home
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());

  // //menu
  // getIt.registerLazySingleton<MenuServices>(
  //     () => MenuServices(dio: dio, localStorage: storage));
  // getIt.registerLazySingleton<MenuRepo>(() => MenuRepo(menuService: getIt()));
  // getIt.registerFactory<MenuCubit>(() => MenuCubit(menuRepo: getIt()));
  // // getIt.registerFactory<CartCubit>(() => CartCubit());
  // getIt.registerSingleton<CartCubit>(CartCubit());
  // //products
  // getIt.registerLazySingleton<ProductService>(
  //     () => ProductService(dio: dio, localStorage: storage));
  // getIt.registerLazySingleton<ProductRepo>(
  //     () => ProductRepo(productService: getIt()));
  // getIt.registerFactory<ProductCubit>(() => ProductCubit(productRepo: getIt()));
  // // //Signup
  // // getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  // getIt.registerFactory<PaymentCubit>(() => PaymentCubit());

  //splash cubit
  getIt.registerFactory<SplashCubit>(() => SplashCubit(localStorage: storage));
  //stepper cubit
  getIt.registerFactory<StepperCubit>(() => StepperCubit());
  //Toggle Password Cubit
  getIt.registerFactory<TogglePasswordCubit>(() => TogglePasswordCubit());
  //Salary Cubit
  getIt.registerFactory<SalaryCubit>(() => SalaryCubit());
}
