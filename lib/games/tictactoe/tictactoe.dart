import 'package:get/get.dart';
import 'package:nonamegamesuite/core/navigation_controller.dart';
import 'package:nonamegamesuite/dashboard/dashboard_service.dart';
import 'package:nonamegamesuite/games/tictactoe/tictactoe_controller.dart';
import 'view/tictactoe_view.dart';

class TicTacToe {
  TicTacToe() {
    // add TicTacToe to the dashboard
    DashboardService dashboardService = Get.find<DashboardService>();
    dashboardService.games.add(DashboardIcon(name: 'TicTacToe', navigationTarget: '/tictactoe'));

    // add routes for tictactoe to the navigation service
    NavigationController navigationController = Get.find<NavigationController>();
    navigationController.addNavigationPage(
      page: GetPage(
        name: '/tictactoe',
        page: () => TicTacToeView(),
        bindings: [
          TicTacToeRouteBinding(),
        ],
      ),
    );
  }
}

// Binding to start the correct controller for tictactow
class TicTacToeRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TicTacToeController());
  }
}
