import 'package:get/get.dart';
import 'package:nonamegamesuite/dashboard/dashboard_view.dart';

class NavigationController extends GetxController {

  List<GetPage> _navigationPages = [];
  List<GetPage> get navigationPages => _navigationPages;


  @override
  void onInit() {
    addNavigationPage(page: GetPage(name: '/', page: () => DashboardView()));
  }

  void addNavigationPage({required GetPage page}) {
    _navigationPages.add(page);
  }

  void addNavigationPages({required List<GetPage> pages}) {
    _navigationPages.addAll(pages);
  }
}