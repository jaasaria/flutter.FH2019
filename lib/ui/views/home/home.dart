import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/category_viewmodel.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/category_button.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:fh2019/core/shared/custom_assets.dart';
import 'package:fh2019/ui/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;

//   Category _selectedCategory = Category.listCategory[1];

//   CategoryViewModel categoryViewModel = locator<CategoryViewModel>();

  @override
  void initState() {
    super.initState();
    // setCategory();

    if (mounted) {
      //   _initCategory();
    }
  }

//   void setCategory(Category category) {
//     setState(() {
//       _selectedCategory = category;
//     });
//   }

  test() {
    print('fsa');
  }

  _initCategory() async {
    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);

    // categoryViewModel.setSelectedCategory();

    categoryViewModel.setSelectedCategory(Category.listCategory[2]);
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
            CarouselSlider(
              height: 130,
              // aspectRatio: 16 / 9,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 10),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              items: CustomAssets.banner.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 20),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: itemViewModel.getFilterItems.map((index) {
                  return ItemCard(
                    img: index.image,
                    title: index.name,
                    category: index.category,
                    price: index.price,
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
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Summary',
                              style: Theme.of(context).textTheme.caption),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('4 Items',
                                  style: Theme.of(context).textTheme.subhead),
                              Text('Total 533.53',
                                  style: Theme.of(context).textTheme.subhead)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
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
                      func: proceed,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: new FooterButton(
                      color: CustomColors.blue,
                      title: "Proceed",
                      func: proceed,
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

  proceed() {}
}
