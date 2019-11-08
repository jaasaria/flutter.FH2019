import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class End extends StatefulWidget {
  End({Key key}) : super(key: key);
  _EndState createState() => _EndState();
}

class _EndState extends State<End> with AutomaticKeepAliveClientMixin<End> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Thanks for ordering!",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Please enjoy your meal",
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.black,
                        ),
                  )
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                      color: CustomColors.green,
                      title: "Finish",
                      func: () => finish(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void finish() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.start, (Route<dynamic> route) => false);
  }
}
