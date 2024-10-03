import 'package:movie/model/movie_model.dart';

class favorite_model {
  final int id;
  final int user_id;
  final int movie_id;
  movie_model movie;
  favorite_model({
    required this.id,
    required this.user_id,
    required this.movie_id,
    required this.movie,
  });
  factory favorite_model.fromjson(Map<String,dynamic>json){
    return favorite_model(
      id:json['id'],
      user_id:json['user_id'],
      movie_id:json['movie_id'],
      movie:movie_model.fromjson(json['movie']),
    );
  }
}
