import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/core/player/player_model.dart';
import 'package:nonamegamesuite/core/player/player_service.dart';
import 'package:nonamegamesuite/core/player/view_parts/player_list_part.dart';
import 'package:nonamegamesuite/core/player/view_parts/player_selection_part.dart';

class PlayerAdminView extends StatelessWidget {
  final PlayerService _playerService = Get.find<PlayerService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Material(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15, top: 50),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Spielerverwaltung',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// List with the players
              PlayerList(),

              /// bottom section with current players and the add player functionality
              Material(
                elevation: 5,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Aktuelle Spieler',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PlayerSelection(playerIndex: 0),
                          const Text('vs'),
                          PlayerSelection(playerIndex: 1),
                        ],
                      ),
                    ),

                    /// add player
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 100),
                      child: ElevatedButton(
                        onPressed: () {
                          final TextEditingController _textEditingController = TextEditingController();
                          Get.defaultDialog(
                            title: 'Spieler hinzufügen',
                            content: TextField(
                              controller: _textEditingController,
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            confirm: ElevatedButton(
                                onPressed: () {
                                  _playerService.players.add(Player(name: _textEditingController.text));
                                  Get.back();
                                  SystemChrome.restoreSystemUIOverlays();
                                },
                                child: const Text('Hinzufügen')),
                          );
                        },
                        child: const Text('Spieler hinzufügen'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
