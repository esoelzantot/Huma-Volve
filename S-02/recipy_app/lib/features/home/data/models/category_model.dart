import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

class CategoryModel extends CategoryEntity {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoryModel({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  }) : super(name: strCategory!);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    idCategory: json['idCategory'],
    strCategory: json['strCategory'],
    strCategoryThumb: json['strCategoryThumb'],
    strCategoryDescription: json['strCategoryDescription'],
  );
}
