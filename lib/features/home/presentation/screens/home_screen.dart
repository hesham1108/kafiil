import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/constants/na_bar_items.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/navigation_cubit.dart';
import 'package:kafiil/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:kafiil/features/who_am_i/presentation/screens/who_am_i_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        toolbarHeight: 10,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navBarItem == NavBarItems.countries) {
          return const WhoAmIScreen();
        } else if (state.navBarItem == NavBarItems.services) {
          return Container();
        }
        return const WhoAmIScreen();
      }),
    );
  }
}
