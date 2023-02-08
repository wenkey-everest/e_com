import 'dart:convert';

List<Electronics> electronicModelFromJson(String str) => List<Electronics>.from(
    json.decode(str).map((x) => Electronics.fromJson(x)));

String electronicModelToJson(List<Electronics> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Electronics {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final List<String> images;

  Electronics({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory Electronics.fromJson(Map<String, dynamic> json) {
    return Electronics(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      images: List<String>.from(json['images'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': List<dynamic>.from(images.map((x) => x)),
    };
  }
}
