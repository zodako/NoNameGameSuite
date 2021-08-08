import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/core/player/player_service.dart';

class PlayerList extends StatelessWidget {
  late final PlayerService _playerService;

  PlayerList() : _playerService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        child: Obx(
              () => ListView.builder(
            shrinkWrap: true,
            itemCount: _playerService.players.length,
            itemBuilder: (_, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  title: Text(_playerService.players[index].name),
                  trailing: GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Spieler löschen',
                        content: const Center(
                          child: Text('Will du den Spieler wirklich\ndauerhaft löschen?'),
                        ),
                        cancel: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Abbrechen'),
                        ),
                        confirm: OutlinedButton(
                          onPressed: () {
                            _playerService.players.removeAt(index);
                            Get.back();
                          },
                          child: const Text('Löschen'),
                        ),
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
