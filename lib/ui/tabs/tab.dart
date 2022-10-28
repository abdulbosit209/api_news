import 'package:api_with_cubit/ui/tabs/book_mark/book_mark.dart';
import 'package:api_with_cubit/ui/tabs/home_page/home_page.dart';
import 'package:api_with_cubit/ui/tabs/search_page/search_page.dart';
import 'package:api_with_cubit/ui/tabs/settings/settings.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int currentPage = 0;

  List<Widget> screens = [
    HomePage(),
    SearchPage(),
    BookMark(),
    SettingsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        currentIndex: currentPage,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        items: [
          getItem(icon: Icons.home, labelText: "home"),
          getItem(icon: Icons.search, labelText: "search"),
          getItem(icon: Icons.bookmark_border_outlined, labelText: "bookMarks"),
          getItem(icon: Icons.settings, labelText: "settings")
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.black,
        ));
  }
}
