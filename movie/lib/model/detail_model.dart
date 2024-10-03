import 'package:movie/model/favorite_model.dart';

class movie_detail {
  final int id;
  final String title;
  final String description;
  final String image;
  final String video;
  final int subcategories_id;
  List<favorite_detail> favorite;
  movie_detail({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.video,
    required this.subcategories_id,
    required this.favorite,
  });
  factory movie_detail.fromjson(Map<String, dynamic> json) {
    return movie_detail(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      video: json['video'],
      subcategories_id: json['subcategories_id'],
      favorite: (json['favorite'] as List).map((favorite) => favorite_detail.fromjson(favorite)).toList(),
    );
  }
}
class favorite_detail {
  final int id;
  final int user_id;
  final int movie_id;
  favorite_detail({
    required this.id,
    required this.user_id,
    required this.movie_id,
  });
  factory favorite_detail.fromjson(Map<String,dynamic>json){
    return favorite_detail(
      id:json['id'],
      user_id:json['user_id'],
      movie_id:json['movie_id'],
    );
  }
}
