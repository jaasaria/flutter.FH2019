import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  String title;
  Color color;
  Function func;

  FooterButton(
      {@required this.title,
      @required this.color,
      @required this.func,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      onPressed: func,
      disabledColor: Colors.grey,
      color: color,
      child: Text(
        "${title.toString()}",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
