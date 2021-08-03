import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe_controller.dart';
import 'package:nonamegamesuite/games/tictactoe/view/tictactoe_view_landscape.dart';
import 'package:nonamegamesuite/games/tictactoe/view/tictactoe_view_portrait.dart';

class TicTacToeView extends StatelessWidget {
  final TicTacToeController _ticTacToeController = Get.find<TicTacToeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
            builder: (_, orientation) => orientation == Orientation.portrait
                ? TicTacToeViewPortrait(
                    ticTacToeController: _ticTacToeController,
                    borderFunction: _determineBorder,
                  )
                : TicTacToeViewLandscape(
                    ticTacToeController: _ticTacToeController,
                    borderFunction: _determineBorder,
                  )),
      ),
    );
  }

  BorderSide _borderSide() => BorderSide(color: Colors.teal, width: 3.0);

  Border _determineBorder(int index) {
    switch (index) {
      case 0:
        return Border(bottom: _borderSide(), right: _borderSide());
      case 1:
        return Border(bottom: _borderSide(), left: _borderSide(), right: _borderSide());
      case 2:
        return Border(bottom: _borderSide(), left: _borderSide());
      case 3:
        return Border(top: _borderSide(), bottom: _borderSide(), right: _borderSide());
      case 4:
        return Border(top: _borderSide(), bottom: _borderSide(), left: _borderSide(), right: _borderSide());
      case 5:
        return Border(top: _borderSide(), bottom: _borderSide(), left: _borderSide());
      case 6:
        return Border(top: _borderSide(), right: _borderSide());
      case 7:
        return Border(top: _borderSide(), left: _borderSide(), right: _borderSide());
      case 8:
        return Border(top: _borderSide(), left: _borderSide());
      default:
        return Border.all();
    }
  }
}
