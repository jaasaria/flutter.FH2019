import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'incremental_button.dart';

class CheckOutCard extends StatefulWidget {
  Item item;

  CheckOutCard({
    @required this.item,
    Key key,
  }) : super(key: key);

  @override
  _CheckOutCardState createState() => _CheckOutCardState();
}

class _CheckOutCardState extends State<CheckOutCard> {
  deleteItem() {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    setState(() {
      itemViewModel.deleteCartItem(widget.item);
      widget.item.addCart = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 3, left: 8, right: 8),
      child: Card(
        elevation: 3,
        child: Container(
          width: CustomMedia.screenWidth,
          height: CustomMedia.screenHeight * .15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: CustomMedia.screenWidth * .20,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "${widget.item.image}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: CustomMedia.screenWidth * .65,
                      height: 70,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '${widget.item.name}',
                                    style: Theme.of(context).textTheme.body2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  '${widget.item.price}',
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  '${widget.item.price * widget.item.orderQty}',
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(color: CustomColors.red),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Total',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Stack(
                  children: <Widget>[
                    IncrementalButton(item: widget.item),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 50,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          shape: new ContinuousRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          onPressed: () {},
                          color: Colors.grey[500],
                          child: IconButton(
                            padding: EdgeInsets.only(bottom: 2),
                            color: Colors.white,
                            onPressed: deleteItem,
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
