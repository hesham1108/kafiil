import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/constants/na_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(
          navBarItem: NavBarItems.whoAmI,
          index: 0,
        ));

  void getNavBarItem(NavBarItems navBarItem) {
    switch (navBarItem) {
      case NavBarItems.whoAmI:
        emit(const NavigationState(navBarItem: NavBarItems.whoAmI, index: 0));
        break;
      case NavBarItems.countries:
        emit(
            const NavigationState(navBarItem: NavBarItems.countries, index: 1));
        break;

      case NavBarItems.services:
        emit(const NavigationState(navBarItem: NavBarItems.services, index: 2));
        break;

      default:
        emit(const NavigationState(navBarItem: NavBarItems.whoAmI, index: 0));
        break;
    }
  }

  void setIndex(int index) {
    switch (index) {
      case 0:
        getNavBarItem(NavBarItems.whoAmI);
        break;
      case 1:
        getNavBarItem(NavBarItems.countries);
        break;
      case 2:
        getNavBarItem(NavBarItems.services);
        break;

      default:
        getNavBarItem(NavBarItems.whoAmI);
    }
  }
}
