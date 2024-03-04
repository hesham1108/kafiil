import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/di/dependancy_injection.dart';
import 'package:kafiil/core/helpers/bloc_observer.dart';
import 'package:kafiil/core/routing/app_router.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/core/theming/colors.dart';

void main() {
  Future.wait([setupGetIt()]);
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: ColorsManager
            .mainColor), // Replace Colors.red with your desired color
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kafiil',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.mainColor),
          useMaterial3: true,
        ),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
