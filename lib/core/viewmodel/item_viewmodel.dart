import 'package:fh2019/core/models/base_model.dart';
import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/models/item.dart';

class ItemViewModel extends BaseModel {
  List<Item> _filterItems = Item.listServices;

  List<Item> get getAllItems => Item.listServices;
  List<Item> get getCheckOutItems =>
      Item.listServices.where((data) => data.addCart).toList();

  double get getCheckOutItemsTotalAmount {
    List<Item> items = Item.listServices.where((data) => data.addCart).toList();
    // double total = items.reduce((curr, next) => curr + next);
    double total = 0;
    items.forEach((data) {
      total += data.price * data.orderQty;
    });
    return total;
  }

//   double get getCheckOutItemsQty(Item item) {
//     List<Item> items = Item.listServices.where((data) => data.addCart).toList();
//     // double total = items.reduce((curr, next) => curr + next);
//     double total = 0;
//     items.forEach((data) {
//       total += data.price * data.orderQty;
//     });
//     return total;
//   }

  List<Item> get getFilterItems => _filterItems;

  filterItem(Category category) async {
    if (category.name == "All") {
      _filterItems = getAllItems;
    } else {
      _filterItems = [];
      getAllItems.forEach((val) {
        val.category.forEach((cat) {
          if (cat.name == category.name) {
            _filterItems.add(val);
          }
        });
      });
    }
    notifyListeners();
  }

  deleteCartItem(Item item) async {
    Item.listServices.where((data) {
      if (data == item) {
        return data.addCart = false;
      }
      return null;
    });
    notifyListeners();
  }

  updateCartItem(Item item, bool status) async {
    Item.listServices.where((data) {
      if (data == item) {
        print('abc55');
        return data.addCart = status;
      }
      return null;
    });
    notifyListeners();
  }

  incrementCartItemQty(Item item) async {
    Item.listServices.where((data) {
      if (data == item) {
        data.orderQty = 1;
        return true;
      }
      return null;
    });
    notifyListeners();
  }

  decrementCartItemQty(Item item) async {
    Item.listServices.where((data) {
      if (data == item) {
        data.orderQty -= 1;
        return true;
      }
      return null;
    });
    notifyListeners();
  }

  resetCartItemOrder() async {
    Item.listServices.forEach((data) {
      data.addCart = false;
      data.orderQty = 1;
    });
    notifyListeners();
  }
}
