part of 'navigation_cubit.dart';

// abstract class NavigationState extends Equatable {
//   const NavigationState();
// }

class NavigationState extends Equatable {
  final NavBarItems navBarItem;
  final int index;
  const NavigationState({
    required this.navBarItem,
    required this.index,
  });
  @override
  List<Object> get props => [navBarItem, index];
}
