import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/core/player/player_service.dart';

class PlayerSelection extends StatelessWidget {
  late final PlayerService _playerService;

  final int playerIndex;

  PlayerSelection({required this.playerIndex}) : _playerService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FixedExtentScrollController _wheelController = FixedExtentScrollController(
          initialItem: _playerService.players.indexOf(_playerService.currentPlayers[playerIndex]),
        );
        Get.dialog(
          Center(
            child: Container(
              color: Colors.white,
              width: Get.width * 0.6,
              height: Get.height * 0.3,
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            child: Container(
                              height: 20,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          ListWheelScrollView.useDelegate(
                            physics: const FixedExtentScrollPhysics(),
                            controller: _wheelController,
                            itemExtent: 30,
                            diameterRatio: 0.7,
                            overAndUnderCenterOpacity: 0.4,
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (_, index) {
                                if (index < 0 || index >= _playerService.players.length) {
                                  return null;
                                } else {
                                  return Align(
                                    child: Text(
                                      _playerService.players[index].name,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _playerService.changeCurrentPlayer(
                          index: playerIndex,
                          newPlayer: _wheelController.selectedItem,
                        );
                        Get.back();
                      },
                      child: const Text('Okay'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 50,
        width: Get.width * 0.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all()),
        child: Obx(
          () => Text(_playerService.currentPlayers.isNotEmpty ? _playerService.currentPlayers[playerIndex].name : ''),
        ),
      ),
    );
  }
}
