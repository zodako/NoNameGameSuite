import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/core/navigation_service.dart';
import 'package:nonamegamesuite/core/player/player_service.dart';
import 'package:nonamegamesuite/dashboard/dashboard_service.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe.dart';

void main() {
  initServices();
  initGames();

  runApp(NoNameGameSuite());
}

void initServices() {
  Get.put(DashboardService());
  Get.put(NavigationService());
  Get.put(PlayerService());

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
      getPages: Get.find<NavigationService>().navigationPages,
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