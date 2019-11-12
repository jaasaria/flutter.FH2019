import 'package:animator/animator.dart';
import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
                child: Animator(
                    tweenMap: {
                  "opacity": Tween<double>(begin: 0, end: 1),
                  "scale": Tween<double>(begin: 0, end: 1),
                  "translation":
                      Tween<Offset>(begin: Offset(0, -.5), end: Offset.zero),
                },
                    duration: Duration(milliseconds: 3000),
                    curve:
                        Interval(0, .7, curve: Curves.fastLinearToSlowEaseIn),
                    builderMap: (Map<String, Animation> anim) => FadeTransition(
                        opacity: anim["opacity"],
                        child: FractionalTranslation(
                            translation: anim["translation"].value,
                            child: ScaleTransition(
                                scale: anim["scale"],
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: CustomMedia.screenHeight * .25),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: CustomMedia.screenWidth * .4,
                                        height: CustomMedia.screenHeight * .2,
                                        child: FlareActor(
                                          "assets/flare/success_check.flr",
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          animation: 'Untitled',
                                        ),
                                      ),
                                      Text(
                                        "Thanks for Ordering",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline
                                            .copyWith(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        "Please enjoy your meal",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subhead
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      )
                                    ],
                                  ),
                                )))))),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Animator(
                tweenMap: {
                  "opacity": Tween<double>(begin: 0, end: 1),
                  "translation":
                      Tween<Offset>(begin: Offset(0, -.5), end: Offset.zero),
                },
                cycles: 1,
                duration: Duration(milliseconds: 3000),
                curve: Interval(0, .6, curve: Curves.fastOutSlowIn),
                builderMap: (Map<String, Animation> anim) => FadeTransition(
                    opacity: anim["opacity"],
                    child: FractionalTranslation(
                        translation: anim["translation"].value,
                        child: Container(
                          padding: EdgeInsets.all(20),
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
                        )))),
          ],
        ));
  }

  void finish() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.start, (Route<dynamic> route) => false);
  }
}
