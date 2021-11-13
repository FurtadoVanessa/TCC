import 'package:flutter/material.dart';

class NavigationBarController extends StatefulWidget {
  final Function(int position) onChanged;

  NavigationBarController(this.onChanged);

  _NavigationBarView createState() => _NavigationBarView();
}

class _NavigationBarView extends State<NavigationBarController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Theme.of(context).accentColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() => _currentIndex = value);
        widget.onChanged(value);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Monitorar',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Conta',
          icon: Icon(Icons.account_circle_rounded),
        ),
      ],
    );
  }
}
