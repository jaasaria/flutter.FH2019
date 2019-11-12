import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/start_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);
  _StartState createState() => _StartState();
}

class _StartState extends State<Start>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Start> {
  @override
  bool get wantKeepAlive => true;

  Curve buttonCurves = Curves.fastLinearToSlowEaseIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Animator(
                  tweenMap: {
                    "opacity": Tween<double>(begin: 0, end: 1),
                    "scale": Tween<double>(begin: 0, end: 1),
                    "translation":
                        Tween<Offset>(begin: Offset(0, .5), end: Offset.zero),
                  },
                  duration: Duration(milliseconds: 3000),
                  curve: Interval(0, .5, curve: Curves.fastLinearToSlowEaseIn),
                  builderMap: (Map<String, Animation> anim) => FadeTransition(
                    opacity: anim["opacity"],
                    child: FractionalTranslation(
                      translation: anim["translation"].value,
                      child: ScaleTransition(
                          scale: anim["scale"], child: CarouselBanner()),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                            "translation": Tween<Offset>(
                                begin: Offset(0, -.1), end: Offset.zero),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.3, 0.8, curve: Curves.easeOutSine),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: FractionalTranslation(
                              translation: anim["translation"].value,
                              child: ScaleTransition(
                                scale: anim["scale"],
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: CustomMedia.screenHeight * .1,
                                  ),
                                  child: Container(
                                    height: CustomMedia.screenHeight * .10,
                                    child: Image.asset(
                                      "assets/images/logos/logo.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                            "translation": Tween<Offset>(
                                begin: Offset(0, .10), end: Offset.zero),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.3, 0.8, curve: Curves.easeOutSine),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: FractionalTranslation(
                              translation: anim["translation"].value,
                              child: ScaleTransition(
                                scale: anim["scale"],
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: CustomMedia.screenHeight * .025,
                                    bottom: CustomMedia.screenHeight * .005,
                                  ),
                                  child: Text(
                                    "Dart Comrade",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.5, 1, curve: Curves.easeInOutBack),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: ScaleTransition(
                              scale: anim["scale"],
                              child: Text(
                                'Pilipino food ordering app in a fun and smart way',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: CustomMedia.screenHeight * .05,
                        ),
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                            "translation": Tween<Offset>(
                                begin: Offset(0, .5), end: Offset.zero),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.4, 0.8, curve: buttonCurves),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: FractionalTranslation(
                              translation: anim["translation"].value,
                              child: ScaleTransition(
                                scale: anim["scale"],
                                child: Container(
                                  width: CustomMedia.screenWidth * .8,
                                  child: StartButton(
                                    title: "Start",
                                    description: "Select your order here",
                                    color: CustomColors.green,
                                    func: manual,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                            "translation": Tween<Offset>(
                                begin: Offset(0, .5), end: Offset.zero),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.45, 0.8, curve: buttonCurves),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: FractionalTranslation(
                              translation: anim["translation"].value,
                              child: ScaleTransition(
                                scale: anim["scale"],
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: CustomMedia.screenHeight * .015,
                                  ),
                                  width: CustomMedia.screenWidth * .8,
                                  child: StartButton(
                                    title: "Face Me!",
                                    description:
                                        "Order base on your Facial Expresssion",
                                    color: CustomColors.green,
                                    func: facial,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Animator(
                          tweenMap: {
                            "opacity": Tween<double>(begin: 0, end: 1),
                            "scale": Tween<double>(begin: 0, end: 1),
                            "translation": Tween<Offset>(
                                begin: Offset(0, .5), end: Offset.zero),
                          },
                          duration: Duration(milliseconds: 3000),
                          curve: Interval(0.5, 0.8, curve: buttonCurves),
                          builderMap: (Map<String, Animation> anim) =>
                              FadeTransition(
                            opacity: anim["opacity"],
                            child: FractionalTranslation(
                              translation: anim["translation"].value,
                              child: ScaleTransition(
                                scale: anim["scale"],
                                child: Container(
                                  width: CustomMedia.screenWidth * .8,
                                  child: StartButton(
                                    title: "Eat This!",
                                    description:
                                        "Challenge your self with auto generated Menu Item",
                                    color: CustomColors.green,
                                    func: play,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
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
              curve: Interval(0, .5, curve: Curves.fastOutSlowIn),
              builderMap: (Map<String, Animation> anim) => FadeTransition(
                opacity: anim["opacity"],
                child: FractionalTranslation(
                  translation: anim["translation"].value,
                  child: Container(
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
                              '© 2019. Made with ❤️',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              'Developed by: Adrian Evangelista and John Andrew Asaria',
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
                      )),
                ),
              ),
            ),
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
