import 'package:flutter/material.dart';

enum NavBarItems { menu, cart, offers, profile, categories }

class NavItems {
  static final List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      tooltip: 'Menu',
      icon: Icon(Icons.fastfood),
      label: 'Menu',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.percent),
      label: 'offer',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'profile',
    ),
  ];
}
