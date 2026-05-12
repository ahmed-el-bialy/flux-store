import '../../core/constants/constants.dart';
import '../../core/helper/api.dart';
import '../models/category_model.dart';

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
