import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  String title;
  String description;
  Color color;
  Function func;

  StartButton(
      {@required this.title,
      @required this.description,
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
        color: color,
        child: Column(
          children: <Widget>[
            Text(
              "${title.toString()}",
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "${description.toString()}",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.grey[350]),
            ),
          ],
        ));
  }
}
