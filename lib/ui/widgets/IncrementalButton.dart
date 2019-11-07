import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';

class IncrementalButton extends StatelessWidget {
  const IncrementalButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 50,
            child: FlatButton(
                padding: EdgeInsets.all(0),
                shape: new ContinuousRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                color: CustomColors.green,
                child: Text(
                  "-",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                )),
          ),
          Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(5.0)),
            child: Center(child: Text('1')),
          ),
          Container(
            width: 50,
            child: FlatButton(
                padding: EdgeInsets.all(0),
                shape: new ContinuousRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                color: CustomColors.green,
                child: Text(
                  "+",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
