import 'package:movie/model/favorite_model.dart';

class movie_model {
  final int id;
  final String title;
  final String description;
  final String image;
  final int subcategories_id;
  // List<favorite_model> favorite;
  movie_model({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.subcategories_id,
    // required this.favorite,
  });
  factory movie_model.fromjson(Map<String, dynamic> json) {
    return movie_model(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      subcategories_id: json['subcategories_id'],
      // favorite: (json['favorite'] as List).map((favorite) => favorite_model.fromjson(favorite)).toList(),
    );
  }
}
