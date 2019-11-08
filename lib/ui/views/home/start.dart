import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/category_viewmodel.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/category_button.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:fh2019/ui/widgets/footer_summary.dart';
import 'package:fh2019/ui/widgets/item_card.dart';
import 'package:fh2019/ui/widgets/start_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);
  _StartState createState() => _StartState();
}

class _StartState extends State<Start>
    with AutomaticKeepAliveClientMixin<Start> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Need to add description. Next Item description
                  Container(
                    width: CustomMedia.screenWidth * .8,
                    child: StartButton(
                      title: "Start",
                      description: "Select your order here",
                      color: CustomColors.green,
                      func: manual,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: CustomMedia.screenWidth * .8,
                    child: StartButton(
                      title: "Face Me!",
                      description: "Order base on your Facial Expresssion",
                      color: CustomColors.green,
                      func: facial,
                    ),
                  ),
                  Container(
                    width: CustomMedia.screenWidth * .8,
                    child: StartButton(
                      title: "Eat This!",
                      description:
                          "Challenge your self with auto generated Menu Item",
                      color: CustomColors.green,
                      func: play,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                height: CustomMedia.screenHeight * .10,
                width: CustomMedia.screenWidth,
                padding: EdgeInsets.all(5),
                color: Colors.grey[200],
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to Dart Comrade',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.grey),
                      ),
                      Text(
                        'Pilipino ordering app in a fun and smart way.',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  )),
                ))
          ],
        ));
  }

  void play() {
    Navigator.of(context).pushNamed(Routes.play);
  }

  void manual() {
    Navigator.of(context).pushNamed(Routes.home);
  }

  facial() {
    Navigator.of(context).pushNamed(Routes.facial);
  }
}
