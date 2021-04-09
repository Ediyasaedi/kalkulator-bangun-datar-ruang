import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:kalkulatormobileapps/menu/bangun_datar/main_bangun_datar.dart';
import 'package:kalkulatormobileapps/menu/bangun_ruang/main_bangun_ruang.dart';
import 'package:kalkulatormobileapps/menu/calculator/calculator_page.dart';
import 'package:kalkulatormobileapps/menu/menu.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/imgs/logo.png"),
        ),
        title: Text("Bang Angtar"),
      ),
      body: Container(
        child: Center(
          child: _getPage(currentPage),
        ),
        decoration: BoxDecoration(color: Colors.white),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.tab_sharp, title: "B. Ruang"),
          TabData(iconData: Icons.square_foot_outlined, title: "B. Datar"),
          TabData(iconData: Icons.calculate, title: "Kalkulator")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return MenuPage();
        break;
      case 1:
        return MainBangunRuang();
        break;
      case 2:
        return MainBangunDatar();
        break;
      default:
        return CalculatorPage();
    }
  }
}
