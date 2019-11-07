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

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Colors.white,
    // ));

    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);

    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
        body: Column(
          children: <Widget>[
            CarouselBanner(),
            Expanded(
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 20),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: itemViewModel.getFilterItems.map((index) {
                  return ItemCard(
                    item: index,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: CustomMedia.screenHeight * .17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: CustomMedia.screenHeight * .06,
                      child: ListView.builder(
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
                        },
                      )),
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
            )
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
    print('view order');
    Navigator.of(context).pushNamed(Routes.checkout);
  }

  cancelOrder() {
    // Navigator.of(context).pushNamed(Routes.checkout);
  }
}
