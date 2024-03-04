import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/constants/na_bar_items.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/navigation_cubit.dart';
import 'package:kafiil/features/home/presentation/widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navBarItem == NavBarItems.cart) {
          return Container();
        } else if (state.navBarItem == NavBarItems.offers) {
          return Container();
        } else if (state.navBarItem == NavBarItems.profile) {
          return Container();
        } else if (state.navBarItem == NavBarItems.categories) {
          return Container();
        }
        return Container();
      }),
    );
  }
}
