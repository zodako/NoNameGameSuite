import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/core/navigation_controller.dart';
import 'package:nonamegamesuite/dashboard/dashboard_service.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe.dart';

void main() {
  Get.put(DashboardService());
  Get.put(NavigationController());

  initGames();

  runApp(NoNameGameSuite());
}

void initGames() {
  TicTacToe ticTacToe = TicTacToe();
}

class NoNameGameSuite extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: Get.find<NavigationController>().navigationPages,
    );
  }
}



/// Game Ideen
/// * TicTacToe
/// * 4 Gewinnt
/// * StadtLandFluss Buchstaben Vorschläge
/// * Mensch Ärgere dich nicht und vergleichbar
///
///
/// Really crazy future Stuff:
/// * Wer bin ich (braucht dann wohl doch eine Datenbank dahinter :D)