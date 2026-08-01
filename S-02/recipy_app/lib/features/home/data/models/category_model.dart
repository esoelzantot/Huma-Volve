import 'package:hive/hive.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends CategoryEntity {
  @HiveField(0)
  String? idCategory;
  @HiveField(1)
  String? strCategory;
  @HiveField(2)
  String? strCategoryThumb;
  @HiveField(3)
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
