import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum NavBarItems { whoAmI, countries, services }

class NavItems {
  static final List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      tooltip: 'Who Am I',
      icon: SvgPicture.asset('assets/icons/who_am_i.svg'),
      label: 'Who Am I',
    ),
    BottomNavigationBarItem(
      tooltip: 'Countries',
      icon: SvgPicture.asset('assets/icons/countries.svg'),
      label: 'Countries',
    ),
    BottomNavigationBarItem(
      tooltip: 'Services',
      icon: SvgPicture.asset('assets/icons/services.svg'),
      label: 'Services',
    ),
  ];
}
