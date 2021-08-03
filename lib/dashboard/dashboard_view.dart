import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/dashboard/dashboard_service.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardService _dashboardService = Get.find<DashboardService>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'NoNameGameSuite',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Obx(
              () => Wrap(
                children: [for (var element in _dashboardService.games) element.dashboardIcon],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
