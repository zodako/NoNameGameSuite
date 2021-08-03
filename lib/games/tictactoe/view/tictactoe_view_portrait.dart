import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe_controller.dart';

class TicTacToeViewPortrait extends StatelessWidget {

  final TicTacToeController ticTacToeController;
  final Function borderFunction;

  TicTacToeViewPortrait({required this.ticTacToeController, required this.borderFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'TicTacToe',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              width: Get.width * 0.8,
              height: Get.width * 0.8,
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
                            style: TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      child: Obx(
                            () => Text(
                          '${ticTacToeController.players[0].name} (${ticTacToeController.players[0].symbol})',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              decoration: ticTacToeController.currentPlayer.value == 0
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Obx(() => Text('${ticTacToeController.players[0].score} Punkte')),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Obx(
                            () => Text(
                          '${ticTacToeController.players[1].name} (${ticTacToeController.players[1].symbol})',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              decoration: ticTacToeController.currentPlayer.value == 1
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                        ),
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
