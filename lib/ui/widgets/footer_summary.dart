import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';

class FooterSummary extends StatelessWidget {
  const FooterSummary({
    Key key,
    @required this.itemViewModel,
  }) : super(key: key);

  final ItemViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Summary', style: Theme.of(context).textTheme.caption),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${itemViewModel.getCheckOutItems.length} Items',
                    style: Theme.of(context).textTheme.subhead),
                Text('Total ${itemViewModel.getCheckOutItemsTotalAmount}',
                    style: Theme.of(context).textTheme.subhead)
              ],
            )
          ],
        ),
      ),
    );
  }
}
