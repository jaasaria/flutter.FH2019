import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  String title;
  Function func;
  bool active = false;

  CategoryButton({
    @required this.title,
    @required this.func,
    this.active,
    Key key,
  }) : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: new RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 1),
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: () => widget.func,
        color: widget.active ? CustomColors.yellow : Colors.grey[200],
        child: Text(
          "${widget.title}",
          style: TextStyle(
            color: widget.active ? Colors.black : Colors.black,
          ),
        ));
  }
}
