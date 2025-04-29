class Product {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  List<dynamic>? availableColors;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
     this.sold,
     this.images,
     this.subcategory,
     this.ratingsQuantity,
     this.id,
     this.title,
     this.slug,
     this.description,
     this.quantity,
     this.price,
     this.priceAfterDiscount,
     this.availableColors,
     this.imageCover,
     this.category,
     this.brand,
     this.ratingsAverage,
     this.createdAt,
     this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'],
      images: List<String>.from(json['images']),
      subcategory: List<Subcategory>.from(
        json['subcategory'].map((x) => Subcategory.fromJson(x)),
      ),
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      availableColors: List<dynamic>.from(json['availableColors']),
      imageCover: json['imageCover'],
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Subcategory {
  String id;
  String name;
  String slug;
  String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}

class Category {
  String id;
  String name;
  String slug;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class Brand {
  String id;
  String name;
  String slug;
  String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
