import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/checkout_card.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:fh2019/ui/widgets/footer_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key key}) : super(key: key);
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut>
    with AutomaticKeepAliveClientMixin<CheckOut> {
  @override
  bool get wantKeepAlive => true;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      // getCheckOutItems
    }
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
        body: Column(
          children: <Widget>[
            new CarouselBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: itemViewModel.getCheckOutItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckOutCard(
                    item: itemViewModel.getCheckOutItems[index],
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: CustomMedia.screenHeight * .10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new FooterSummary(itemViewModel: itemViewModel)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: new FooterButton(
                      title: "Cancel",
                      color: CustomColors.red,
                      func: calcelCheckOut,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: new FooterButton(
                      color: CustomColors.blue,
                      title: "Proceed to Checkout",
                      func: () => proceedCheckOut(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  calcelCheckOut() {
    Navigator.of(context).pop();
  }

  proceedCheckOut() async {
    pr.show();

    await Future.delayed(Duration(seconds: 1));

    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    await itemViewModel.resetCartItemOrder();

    pr.hide();

    // add indicator here
    Navigator.of(context).pushNamed(Routes.end);
  }
}
