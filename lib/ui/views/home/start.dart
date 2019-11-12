import 'dart:async';

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

  bool isStart = false;
  AnimationController _animController;

  Curve buttonCurves = Curves.fastLinearToSlowEaseIn;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animator(
        tweenMap: {
          "color": ColorTween(
              begin: CustomColors.bluelogo, end: Theme.of(context).canvasColor),
        },
        duration: Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        builderMap: (Map<String, Animation> anim) => Scaffold(
            resizeToAvoidBottomPadding: true,
            resizeToAvoidBottomInset: true,
            backgroundColor: anim['color'].value,
            body: Stack(
              children: <Widget>[
                // Animator<double>(
                //     tween: Tween<double>(begin: 0, end: 1),
                //     duration: Duration(milliseconds: 1500),
                //     cycles: 1,
                //     builder: (anim1) => Center(
                //         child: Opacity(
                //             opacity: anim1.value,
                //             child: Animator(
                //               tweenMap: {
                //                 "scaleAnimW": Tween<double>(
                //                     begin: 0, end: CustomMedia.screenWidth),
                //                 "scaleAnimH": Tween<double>(
                //                     begin: 0, end: CustomMedia.screenHeight),
                //               },
                //               curve: Curves.fastOutSlowIn,
                //               cycles: 1,
                //               duration: Duration(milliseconds: 1500),
                //               builderMap: (anim) => Container(
                //                 color: Theme.of(context).canvasColor,
                //                 height: anim['scaleAnimH'].value,
                //                 width: anim['scaleAnimW'].value,
                //               ),
                //             )))),
                Column(
                  children: <Widget>[
                    Animator(
                      tweenMap: {
                        "opacity": Tween<double>(begin: 0, end: 1),
                        "scale": Tween<double>(begin: 0, end: 1),
                        "translation": Tween<Offset>(
                            begin: Offset(0, .5), end: Offset.zero),
                      },
                      cycles: 1,
                      duration: Duration(seconds: 3),
                      curve: Interval(0.5, 1,
                          curve: Curves.fastLinearToSlowEaseIn),
                      builderMap: (Map<String, Animation> anim) =>
                          FadeTransition(
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
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease,
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
                                    begin: Offset(0, -.3), end: Offset.zero),
                              },
                              duration: Duration(milliseconds: 3500),
                              curve:
                                  Interval(0.5, 0.8, curve: Curves.easeOutSine),
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
                              duration: Duration(milliseconds: 3500),
                              curve:
                                  Interval(0.5, 0.8, curve: Curves.easeOutSine),
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
                              cycles: 1,
                              duration: Duration(milliseconds: 5000),
                              curve:
                                  Interval(0.5, 1, curve: Curves.easeInOutBack),
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
                              duration: Duration(seconds: 4),
                              curve: Interval(0.6, 1, curve: buttonCurves),
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
                              duration: Duration(seconds: 4),
                              curve: Interval(0.7, 1, curve: buttonCurves),
                              builderMap: (Map<String, Animation> anim) =>
                                  FadeTransition(
                                opacity: anim["opacity"],
                                child: FractionalTranslation(
                                  translation: anim["translation"].value,
                                  child: ScaleTransition(
                                    scale: anim["scale"],
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            CustomMedia.screenHeight * .015,
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
                              duration: Duration(seconds: 4),
                              curve: Interval(0.8, 1, curve: buttonCurves),
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
                  duration: Duration(seconds: 3),
                  curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn),
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
            )));
  }

  void play() {
    Navigator.of(context).pushNamed(Routes.play);
  }

  void manual() {
    Navigator.of(context).pushNamed(Routes.home);
  }

  facial() {
    print('a');
    setState(() {
      isStart = !isStart;
    });
    // Navigator.of(context).pushNamed(Routes.facial);
  }
}

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final int delay;
  final String id;
  final Curve curve;

  SlideFadeTransition(
      {@required this.child, @required this.id, this.delay, this.curve});

  @override
  SlideFadeTransitionState createState() => SlideFadeTransitionState();
}

class SlideFadeTransitionState extends State<SlideFadeTransition>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    final _curve = CurvedAnimation(
        curve: widget.curve != null ? widget.curve : Curves.decelerate,
        parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.25), end: Offset.zero)
            .animate(_curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      _animController.reset();
      Future.delayed(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void didUpdateWidget(SlideFadeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      _animController.reset();
      Future.delayed(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(position: _animOffset, child: widget.child),
      opacity: _animController,
    );
  }
}
