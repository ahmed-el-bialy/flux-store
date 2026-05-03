import '../models/category_Model.dart';
import '../core/constants/constants.dart';
import '../core/helper/API.dart';

class CategoryListServices {
  Future<List<CategoryModel>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: "$apiUrl/categories");

    List<CategoryModel> categoryList = [];

    for (var element in data) {
      CategoryModel newCategory = CategoryModel.fromJson(element);
      categoryList.add(newCategory);
    }
    return categoryList;
  }
}
