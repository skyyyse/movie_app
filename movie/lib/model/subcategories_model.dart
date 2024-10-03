class subcategories_model{
  final int id;
  final String title;
  final String image;
  final int categories_id;
  subcategories_model({
    required this.id,
    required this.title,
    required this.image,
    required this.categories_id
  });
  factory subcategories_model.fromjson(Map<String, dynamic> json) {
    return subcategories_model(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      categories_id: json['categories_id'],
    );
  }
}