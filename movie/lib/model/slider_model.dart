class slider_model {
  final int id;
  final String image;
  slider_model({
    required this.id,
    required this.image,
  });
  factory slider_model.fromjson(Map<String, dynamic> json) {
    return slider_model(
      id: json['id'],
      image: json['image'],
    );
  }
}
