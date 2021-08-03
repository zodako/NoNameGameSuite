import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardService extends GetxService {
  var games = <DashboardIcon>[].obs;

  @override
  void onInit() {
  }
}

class DashboardIcon {
  Widget dashboardIcon = Container();

  DashboardIcon({String? name, required String navigationTarget}) {
    dashboardIcon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Get.toNamed(navigationTarget),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 75,
            width: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(7, 7),
                  blurRadius: 3,
                  spreadRadius: -5,
                )
              ],
            ),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(name ?? ''),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
