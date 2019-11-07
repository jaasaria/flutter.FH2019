import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementalButton extends StatefulWidget {
  Item item;
  IncrementalButton({
    this.item,
    Key key,
  }) : super(key: key);

  @override
  _IncrementalButtonState createState() => _IncrementalButtonState();
}

class _IncrementalButtonState extends State<IncrementalButton> {
  void increment() {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    setState(() {
      itemViewModel.incrementCartItemQty(widget.item);
      widget.item.orderQty += 1;
    });
  }

  void decrement() {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    setState(() {
      itemViewModel.incrementCartItemQty(widget.item);
      widget.item.orderQty -= 1;
    });
  }

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
                onPressed: widget.item.orderQty <= 1 ? null : () => decrement(),
                disabledColor: Colors.grey,
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
            child: Center(child: Text('${widget.item.orderQty}')),
          ),
          Container(
            width: 50,
            child: FlatButton(
                padding: EdgeInsets.all(0),
                shape: new ContinuousRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () => increment(),
                disabledColor: Colors.grey,
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
