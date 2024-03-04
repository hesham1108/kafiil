import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/features/splash/presentation/logic/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  final bool getData;
  const SplashScreen({super.key, this.getData = false});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  checkUser() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      bool logged = await context.read<SplashCubit>().checkIfUserLogged();
      print(logged);
      Navigator.pushReplacementNamed(
          context, logged ? Routes.homeScreen : Routes.loginScreen);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUser();
    });

    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    // _animation = Tween<double>(
    //   begin: 1.0,
    //   end: 1.5,
    // ).animate(curve);

    // Define the tween
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(curve);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Image.asset(
                    'assets/images/kafiil_logo.png',
                    width: 0.5.sw,
                  ), // Replace 'assets/image.png' with your image path
                );
              },
              // child: RotationTransition(
              //   turns: Tween<double>(
              //     begin: 0,
              //     end: 1,
              //   ).animate(_controller),
              //   child: Image.asset(
              //     'assets/images/main_logo.png',
              //     width: 0.5.sw,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
