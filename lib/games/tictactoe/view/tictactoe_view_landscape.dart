import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe_controller.dart';

typedef BorderFunction = Border Function(int);

class TicTacToeViewLandscape extends StatelessWidget {
  final TicTacToeController ticTacToeController;
  final BorderFunction borderFunction;

  const TicTacToeViewLandscape({required this.ticTacToeController, required this.borderFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'TicTacToe',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Obx(
                      () => Text(
                        '${ticTacToeController.players[0].name} (${ticTacToeController.players[0].symbol})',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: ticTacToeController.currentPlayer.value == 0
                                ? TextDecoration.underline
                                : TextDecoration.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Obx(() => Text('${ticTacToeController.players[0].score} Punkte')),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.height * 0.7,
                  height: Get.height * 0.7,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(
                      9,
                      (index) => GestureDetector(
                        onTap: () {
                          ticTacToeController.playerMove(index);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: borderFunction(index),
                          ),
                          child: Center(
                            child: Obx(
                              () => Text(
                                ticTacToeController.fields[index],
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 75,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => Text(
                        '${ticTacToeController.players[1].name} (${ticTacToeController.players[1].symbol})',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: ticTacToeController.currentPlayer.value == 1
                                ? TextDecoration.underline
                                : TextDecoration.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Obx(() => Text('${ticTacToeController.players[1].score} Punkte')),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
