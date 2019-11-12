import 'package:animator/animator.dart';
import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/category_viewmodel.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/checkout_card.dart';
import 'package:fh2019/ui/widgets/facial_item_card.dart';
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
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<CheckOut> {
  @override
  bool get wantKeepAlive => true;

  ProgressDialog pr;
  AnimationController _controllerList;

  @override
  void initState() {
    super.initState();
    _controllerList = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerList.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    pr = new ProgressDialog(context);
    pr.style(message: "Saving Data...");

    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
              child: itemViewModel.getCheckOutItems.length <= 0
                  ? Container(
                      padding: EdgeInsets.only(
                          bottom: CustomMedia.screenHeight * .25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "No Item",
                            style:
                                Theme.of(context).textTheme.headline.copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            "Select item to checkout",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                  color: Colors.black,
                                ),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: itemViewModel.getCheckOutItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimatedBuilder(
                            animation: _controllerList,
                            builder: (BuildContext context, Widget child) {
                              var count = Category.listCategory.length;
                              var animation =
                                  Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _controllerList,
                                  curve: Interval(.3 + (1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn),
                                ),
                              );
                              _controllerList.forward();
                              return FadeTransition(
                                  opacity: animation,
                                  child: new Transform(
                                      transform: new Matrix4.translationValues(
                                          100 * (1.0 - animation.value),
                                          0.0,
                                          0.0),
                                      // transform: new Matrix4.translationValues(
                                      //     0.0, 50 * (1.0 - animation.value), 0.0),
                                      child: CheckOutCard(
                                        item: itemViewModel
                                            .getCheckOutItems[index],
                                      )));
                            });
                      },
                    ),
            )
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FooterSummary(itemViewModel: itemViewModel),
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
                                  func:
                                      itemViewModel.getCheckOutItems.length >= 1
                                          ? () => proceedCheckOut()
                                          : null,
                                ),
                              )
                            ],
                          ),
                        )))),
          ],
        ));
  }

  calcelCheckOut() {
    Navigator.of(context).pop();
  }

  proceedCheckOut() async {
    pr.show();
    await Future.delayed(Duration(seconds: 1));
    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);
    categoryViewModel.setSelectedCategory(Category.listCategory[0]);

    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    await itemViewModel.resetCartItemOrder();
    await itemViewModel.filterItem(Category.listCategory[0]);

    pr.hide();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.end, (Route<dynamic> route) => false);
  }
}
