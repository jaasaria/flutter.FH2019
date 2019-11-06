import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatefulWidget {
  String title;
  Color color;
  Function func;

  FooterButton({
    @required this.title,
    @required this.color,
    @required this.func,
    Key key,
  }) : super(key: key);

  @override
  _FooterButtonState createState() => _FooterButtonState();
}

class _FooterButtonState extends State<FooterButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      onPressed: () => widget.func,
      color: widget.color,
      child: Text(
        "${widget.title.toUpperCase()}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
