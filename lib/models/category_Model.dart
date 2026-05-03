class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(name: jsonData["slug"]);
  }
}
