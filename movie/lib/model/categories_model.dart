import 'package:movie/model/subcategories_model.dart';
class categories_model {
  final int id;
  final String image;
  final String title;
  List<subcategories_model> subcategories;
  categories_model({
    required this.id,
    required this.title,
    required this.image,
    required this.subcategories,
  });
  factory categories_model.fromjson(Map<String,dynamic>json){
    return categories_model(
      id:json['id'],
      image:json['image'],
      title:json['title'],
      subcategories: (json['subcategories'] as List).map((subcategories) => subcategories_model.fromjson(subcategories)).toList(),
    );
  }
}
