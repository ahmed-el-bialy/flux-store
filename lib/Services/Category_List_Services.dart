import 'package:flux_store/helper/API.dart';
import '../Constants/Constants.dart';
import '../Models/Category_Model.dart';

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
