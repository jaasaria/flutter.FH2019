import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  const ItemCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
//   bool animateCheckBool = true;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widget.item.addCart ? _controller.reverse() : _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  updateAddCartStatus(bool status) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    setState(() {
      itemViewModel.updateCartItem(widget.item, status);
      widget.item.addCart = status;
      status ? _controller.reverse() : _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final rotateAnimation =
        Tween<double>(begin: 0, end: -3).animate(_controller);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              updateAddCartStatus(!widget.item.addCart);
            },
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: CustomMedia.screenHeight * .15,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                      ),
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage("${widget.item.image}"),
                        fit: BoxFit.cover,
                      )
                      // Image.asset(
                      //   "${widget.item.image}",
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
                widget.item.addCart
                    ? Container(
                        height: CustomMedia.screenHeight * .15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(38, 38, 38, 0.6),
                            // borderRadius: BorderRadius.circular(50.0)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(50),
                            )),
                        child: AnimatedBuilder(
                          animation: rotateAnimation,
                          child: Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.white,
                          ),
                          builder: (context, child) {
                            return Transform.rotate(
                                angle: rotateAnimation.value, child: child);
                          },
                        ))
                    : Container(),
                Positioned(
                    top: 5.0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: CustomColors.lightblue,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Text(
                        " ${widget.item.price} ",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    )),
                Positioned(
                  bottom: 5.0,
                  // left: 10.0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: widget.item.category.map((index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(38, 38, 38, 0.6),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Text(
                                "${index.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Colors.white70),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                child: Text(
                  "${widget.item.name}",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
