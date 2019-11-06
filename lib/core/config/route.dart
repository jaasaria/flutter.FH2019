import 'package:fh2019/layout.dart';
import 'package:fh2019/ui/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

// Source
// https://github.com/ravipatel147/navigate
// https://pub.dev/packages/navigate#-readme-tab-

// Command:
// Navigate.navigate(context, Routes.serviceDetail, arg: {'service': service});

var splashHandler = Handler(
    transactionType: TransactionType.fromBottomCenter,
    pageBuilder: (BuildContext context, arg) {
      return Splash();
    });
var layoutHandler = Handler(
    transactionType: TransactionType.fromBottomCenter,
    pageBuilder: (BuildContext context, arg) {
      return Layout();
    });
// var serviceDetailHandler = Handler(
//     transactionType: TransactionType.fromBottomCenter,
//     pageBuilder: (BuildContext context, arg) {
//       return ServiceDetail(service: arg["service"]);
//     });

Map<String, Handler> route = {
  // Routes.serviceDetail: serviceDetailHandler,
  // Routes.test: testHandler
};
