import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salus/feature/chat/view/chat_view.dart';
import 'package:kartal/kartal.dart';

import '../../init/language/locale_keys.g.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavbarState createState() => _NavbarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[const ChatView(), const ChatView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LocaleKeys.navbar_home.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: LocaleKeys.navbar_messages.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: context.colorScheme.primary,
        unselectedItemColor: context.colorScheme.secondary,
        backgroundColor: context.colorScheme.onSecondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
