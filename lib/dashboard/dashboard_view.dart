import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nonamegamesuite/dashboard/dashboard_service.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardService _dashboardService = Get.find<DashboardService>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'NoName Game Suite',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.toNamed('/playeradmin'),
                    icon: const Icon(Icons.contacts),
                  ),
                ],
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
