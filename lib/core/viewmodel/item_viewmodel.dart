import 'package:fh2019/core/models/base_model.dart';
import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/models/item.dart';

class ItemViewModel extends BaseModel {
  List<Item> _filterItems = Item.listServices;

  List<Item> get getAllItems => Item.listServices;
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
}
