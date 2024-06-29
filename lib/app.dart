import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'category_menu_page.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  // Define any state variables and methods here
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
              // TODO: Make currentCategory field take _currentCategory (104)
              currentCategory: _currentCategory,
              // TODO: Pass _currentCategory for frontLayer (104)
              frontLayer: HomePage(category: _currentCategory),
              // TODO: Change backLayer field value to CategoryMenuPage (104)
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('SHRINE'),
              backTitle: const Text('MENU'),
            ),
      },
      theme: _buildShrineTheme(),
    );
  }

  // Theme configuration method
  ThemeData _buildShrineTheme() {
    TextTheme _buildShrineTextTheme(TextTheme base) {
      return base
          .copyWith(
            headline5: base.headline5!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            headline6: base.headline6!.copyWith(
              fontSize: 18.0,
            ),
            caption: base.caption!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
            bodyText1: base.bodyText1!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          )
          .apply(
            fontFamily: 'Rubik',
            displayColor: kShrineBrown900,
            bodyColor: kShrineBrown900,
          );
    }

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePink100,
        onPrimary: kShrineBrown900,
        secondary: kShrineBrown900,
        error: kShrineErrorRed,
      ),
      textTheme: _buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: CutCornersBorder(),
        focusedBorder: CutCornersBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrineBrown900,
          ),
        ),
        floatingLabelStyle: TextStyle(
          color: kShrineBrown900,
        ),
      ),
    );
  }
}
