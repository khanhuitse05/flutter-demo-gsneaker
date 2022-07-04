class Shoes {
  int id;
  String image;
  String name;
  String description;
  double price;
  String? color;
  int count;

  Shoes({
    this.id = 0,
    this.image = '',
    this.name = '',
    this.description = '',
    this.price = 0,
    this.count = 0,
    this.color,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) {
    return Shoes(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      color: json['color'],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['color'] = color;
    data['count'] = count;
    return data;
  }
}
