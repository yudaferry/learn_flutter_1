import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/services.dart';
import 'package:test_1/custom_floating_button.dart';
import 'package:test_1/home_page.dart';
import 'package:test_1/list_menu.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(const ProviderScope(child: AppList()));
  // });
}

class AppList extends StatefulWidget {
  const AppList({super.key});

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  Widget activeWidget = const HomePage();

  void setActiveWidget(widget) {
    setState(() {
      if (floatingMenu.containsKey(widget)) {
        activeWidget = floatingMenu[widget]!.widget;
      } else {
        activeWidget = const HomePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     floatingActionButton: CustomFloatingButton(
    //       onClickMenu: setActiveWidget,
    //     ),
    //     body: activeWidget,
    //   ),
    // );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            activeWidget,
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomFloatingButton(
                  onClickMenu: setActiveWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
