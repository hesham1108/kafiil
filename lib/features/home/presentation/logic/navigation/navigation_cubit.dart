import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafiil/features/home/presentation/logic/navigation/constants/na_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(
          navBarItem: NavBarItems.menu,
          index: 0,
        ));

  void getNavBarItem(NavBarItems navBarItem) {
    switch (navBarItem) {
      case NavBarItems.menu:
        emit(const NavigationState(navBarItem: NavBarItems.menu, index: 0));
        break;
      case NavBarItems.cart:
        emit(const NavigationState(navBarItem: NavBarItems.cart, index: 1));
        break;
      case NavBarItems.categories:
        emit(const NavigationState(
            navBarItem: NavBarItems.categories, index: 2));
        break;
      case NavBarItems.offers:
        emit(const NavigationState(navBarItem: NavBarItems.offers, index: 3));
        break;

      case NavBarItems.profile:
        emit(const NavigationState(navBarItem: NavBarItems.profile, index: 4));
        break;
      default:
        emit(const NavigationState(navBarItem: NavBarItems.menu, index: 0));
        break;
    }
  }

  void setIndex(int index) {
    switch (index) {
      case 0:
        getNavBarItem(NavBarItems.menu);
        break;
      case 1:
        getNavBarItem(NavBarItems.cart);
        break;
      case 2:
        getNavBarItem(NavBarItems.categories);
        break;
      case 3:
        getNavBarItem(NavBarItems.offers);
        break;
      case 4:
        getNavBarItem(NavBarItems.profile);
        break;
      default:
        getNavBarItem(NavBarItems.menu);
    }
  }
}
