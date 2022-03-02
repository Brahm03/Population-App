import 'package:flutter/cupertino.dart';

class ItemBar {
  static  List<BottomNavigationBarItem> mybar  = const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'search'),
   ];
}