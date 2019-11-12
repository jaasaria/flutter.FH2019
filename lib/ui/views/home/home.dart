import 'package:animator/animator.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;
  int rowIndex = 0;
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
    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);

    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
              child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 8)
                      .copyWith(top: 20),
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(itemViewModel.getFilterItems.length,
                      (index) {
                    return AnimatedBuilder(
                        animation: _controllerList,
                        builder: (BuildContext context, Widget child) {
                          var count = Category.listCategory.length;
                          var animation = Tween(begin: 0.0, end: 1.0).animate(
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
                                      0.0, 50 * (1.0 - animation.value), 0.0),
                                  child: ItemCard(
                                    item: itemViewModel.getFilterItems[index],
                                  )));
                        });
                  })),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: CustomMedia.screenHeight * .06,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Category.listCategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CategoryButton(
                                active: categoryViewModel.getSelectedCategory ==
                                        Category.listCategory[index]
                                    ? true
                                    : false,
                                title: Category.listCategory[index].name,
                                func: () =>
                                    setCategory(Category.listCategory[index])),
                          );

                          //   AnimatedBuilder(
                          //       animation: _controllerList,
                          //       builder: (BuildContext context, Widget child) {
                          //         var count = Category.listCategory.length;
                          //         var animation =
                          //             Tween(begin: 0.0, end: 1.0).animate(
                          //           CurvedAnimation(
                          //             parent: _controllerList,
                          //             curve: Interval((1 / count) * index, 1.0,
                          //                 curve: Curves.fastOutSlowIn),
                          //           ),
                          //         );
                          //         _controllerList.forward();
                          //         return FadeTransition(
                          //             opacity: animation,
                          //             child: new Transform(
                          //               transform: new Matrix4.translationValues(
                          //                   100 * (1.0 - animation.value),
                          //                   0.0,
                          //                   0.0),
                          //               child:,
                          //             ));
                          //       });
                        },
                      )),
                  new FooterSummary(itemViewModel: itemViewModel)
                ],
              ),
            ),
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
                                  title: "View Order",
                                  func: () => viewOrder(),
                                ),
                              ),
                            ],
                          ),
                        )))),
          ],
        ));
  }

  setCategory(Category category) {
    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    categoryViewModel.setSelectedCategory(category);
    itemViewModel.filterItem(category);
  }

  void viewOrder() {
    Navigator.of(context).pushNamed(Routes.checkout);
  }

  cancelOrder() {
    Navigator.of(context).pop();
  }
}
