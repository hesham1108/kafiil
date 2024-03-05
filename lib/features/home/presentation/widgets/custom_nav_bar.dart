import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/constants/na_bar_items.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/navigation_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          items: NavItems.navBarItems,
          enableFeedback: true,
          selectedItemColor: ColorsManager.mainColor,
          unselectedItemColor: ColorsManager.grey300,
          // elevation: 5,
          onTap: context.read<NavigationCubit>().setIndex,
        );
      },
    );
  }
}
