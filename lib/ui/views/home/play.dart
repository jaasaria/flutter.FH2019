import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/utils/utility.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Play extends StatefulWidget {
  Play({Key key}) : super(key: key);
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<Play> {
  @override
  bool get wantKeepAlive => true;

  AnimationController _controller;
  Animation<double> _animation;
  double _numberPicture = 0;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animation = _controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  generateRandomNumber() {
    int rng = Utility.generateRandomNumber(Item.listServices.length);

    setState(() {
      _numberPicture = rng.toDouble();
      _animation = new Tween<double>(
        begin: _animation.value,
        end: _numberPicture,
      ).animate(new CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _controller,
      ));
    });
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
                child: Container(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget child) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: CustomMedia.screenHeight * .25,
                          width: MediaQuery.of(context).size.width * .90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "${Item.listServices[_animation.value.toInt()].image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          //   "Item No.: ${_animation.value.toInt()} ",
                          "Item No.: ${_animation.value.toStringAsFixed(1)} ",
                          style: Theme.of(context).textTheme.body1.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          "${Item.listServices[_animation.value.toInt()].name}",
                          style: Theme.of(context).textTheme.headline.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          "Price: ${Item.listServices[_animation.value.toInt()].price} ",
                          style: Theme.of(context).textTheme.headline.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                        ),
                      ],
                    );

                    //
                  },
                ),
              ],
            ))),
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
                      title: "Back",
                      color: CustomColors.red,
                      func: cancelOrder,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: new FooterButton(
                      color: CustomColors.blue,
                      title: "Generate Item",
                      func: () => generateRandomNumber(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  cancelOrder() {
    Navigator.of(context).pop();
  }
}
