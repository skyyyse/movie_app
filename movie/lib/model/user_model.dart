class user_model{
  final int id;
  final String name;
  final String? phone;
  final String email;
  final String? address;
  final String? image;
  user_model({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });
  factory user_model.fromjson(Map<String,dynamic>json){
    return user_model(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      image: json['image'],
    );
  }
}