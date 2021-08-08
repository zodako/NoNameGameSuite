import 'package:get/get.dart';
import 'package:nonamegamesuite/core/player/player_model.dart';

class PlayerService extends GetxService {

  RxList<Player> players = <Player>[].obs;
  RxList<Player> currentPlayers = List.filled(2, Player(name: ''), growable: false).obs;

  List<String> get playerNames => players.map((e) => e.name).toList();

  void changeCurrentPlayer({required int index, required int newPlayer}) {
    currentPlayers[index] = players[newPlayer];
  }


}