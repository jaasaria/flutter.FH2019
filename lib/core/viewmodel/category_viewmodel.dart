import 'package:fh2019/core/models/base_model.dart';
import 'package:fh2019/core/models/category.dart';

class CategoryViewModel extends BaseModel {
  Category _selectedCategory = Category.listCategory[0];

  Category get getSelectedCategory => _selectedCategory;

  setSelectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
