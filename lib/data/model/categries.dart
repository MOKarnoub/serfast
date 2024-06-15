class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImageUrl;

  CategoriesModel(
      {this.categoriesId, this.categoriesName, this.categoriesImageUrl});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImageUrl = json['categories_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_image_url'] = categoriesImageUrl;
    return data;
  }
}