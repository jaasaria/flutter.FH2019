import 'package:fh2019/ui/views/home/play.dart';
import 'package:fh2019/ui/views/home/start.dart';
import 'package:flutter/material.dart';
import 'package:fh2019/ui/views/home/home.dart';
import 'package:toast/toast.dart';
import 'core/shared/custom_media.dart';

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  DateTime backButtonPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    CustomMedia().init(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: scaffoldKey,
        body: Start(),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            currentTime.difference(backButtonPressTime) > Duration(seconds: 2);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = currentTime;
      Toast.show("Double tap to exit application.", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    }
    return true;
  }

  void showToast(String msg) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}
