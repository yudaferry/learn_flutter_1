import 'package:flutter/material.dart';
import 'package:test_1/list_menu.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key, required this.onClickMenu});

  final void Function(String widget) onClickMenu;

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  bool show = false;
  Map<String, Menu> listMenu = {};

  void toggleMenu() {
    setState(() {
      if (listMenu.isEmpty) {
        listMenu = floatingMenu;
      } else {
        listMenu = {};
      }
    });
  }

  void menuClicked(String clickedWidget) {
    widget.onClickMenu(clickedWidget);
    toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...listMenu.keys.map(
          (keyMenu) => Column(
            children: [
              FloatingActionButton(
                onPressed: () => menuClicked(keyMenu),
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  listMenu[keyMenu]!.icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: toggleMenu,
          backgroundColor: Colors.blueGrey,
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
