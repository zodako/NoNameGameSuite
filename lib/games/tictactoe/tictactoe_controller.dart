import 'package:get/get.dart';

class TicTacToeController extends GetxController {
  var fields = List.filled(9, '', growable: false).obs;

  var players = [Player(symbol: 'X', name: 'Spieler 1'), Player(symbol: 'O', name: 'Spieler 2')].obs;
  var currentPlayer = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // restart
  void restart() {
    fields = List.filled(9, '', growable: false).obs;
  }

  // move
  void playerMove(int index) {
    if (fields[index].isEmpty) {
      fields[index] = players[currentPlayer.value].symbol;

      if (_checkWinningCondition()) {
        Get.defaultDialog(title: "Du hast gewonnen!", middleText: 'Gratulation, ${players[currentPlayer.value].name}!');
        players[currentPlayer.value].score++;
        players.refresh();
        restart();
      } else if (_checkDrawCondition()) {
        Get.defaultDialog(title: "Unentschieden!", middleText: 'Unentschieden, versucht es nochmal!');
        restart();
      }

      // Change player
      currentPlayer.value == 0 ? currentPlayer.value = 1 : currentPlayer.value = 0;
    }
  }

  // win
  bool _checkWinningCondition() =>
      (fields[0].isNotEmpty &&
          fields[1].isNotEmpty &&
          fields[2].isNotEmpty &&
          fields[0] == fields[1] &&
          fields[0] == fields[2]) ||
      (fields[3].isNotEmpty &&
          fields[4].isNotEmpty &&
          fields[5].isNotEmpty &&
          fields[3] == fields[4] &&
          fields[3] == fields[5]) ||
      (fields[6].isNotEmpty &&
          fields[7].isNotEmpty &&
          fields[8].isNotEmpty &&
          fields[6] == fields[7] &&
          fields[6] == fields[8]) ||
      (fields[0].isNotEmpty &&
          fields[4].isNotEmpty &&
          fields[8].isNotEmpty &&
          fields[0] == fields[4] &&
          fields[0] == fields[8]) ||
      (fields[6].isNotEmpty &&
          fields[4].isNotEmpty &&
          fields[2].isNotEmpty &&
          fields[6] == fields[4] &&
          fields[6] == fields[2]) ||
      (fields[0].isNotEmpty &&
          fields[3].isNotEmpty &&
          fields[6].isNotEmpty &&
          fields[0] == fields[3] &&
          fields[0] == fields[6]) ||
      (fields[1].isNotEmpty &&
          fields[4].isNotEmpty &&
          fields[7].isNotEmpty &&
          fields[1] == fields[4] &&
          fields[1] == fields[7]) ||
      (fields[2].isNotEmpty &&
          fields[5].isNotEmpty &&
          fields[8].isNotEmpty &&
          fields[2] == fields[5] &&
          fields[2] == fields[8]);

  // draw
  bool _checkDrawCondition() {
    for (var field in fields) {
      if (field.isEmpty) {
        return false;
      }
    }
    return true;
  }

}

// TODO This should be extracted to core service
class Player {
  String symbol;
  var name;
  var score = 0;

  Player({required this.symbol, required this.name});
}
