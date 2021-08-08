import 'package:get/get.dart';
import 'package:nonamegamesuite/core/player/player_admin_view.dart';
import 'package:nonamegamesuite/dashboard/dashboard_view.dart';

class NavigationService extends GetxService {

  final List<GetPage> _navigationPages = [];
  List<GetPage> get navigationPages => _navigationPages;


  @override
  void onInit() {
    addNavigationPage(page: GetPage(name: '/', page: () => DashboardView()));
    addNavigationPage(page: GetPage(name: '/playeradmin', page: () => PlayerAdminView()));
    super.onInit();
  }

  void addNavigationPage({required GetPage page}) {
    _navigationPages.add(page);
  }

  void addNavigationPages({required List<GetPage> pages}) {
    _navigationPages.addAll(pages);
  }
}