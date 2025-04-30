import 'dart:convert';

import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:ecommerce/Domain/entities/Category.dart';

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
  final Category? category;
  final Brand? brand;
  num? ratingsAverage;
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
  try {
    print('Raw JSON: ${jsonEncode(json)}'); // Log raw JSON

    return Product(
      sold: json['sold'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      subcategory: json['subcategory'] != null
          ? List<Subcategory>.from(
              json['subcategory'].map((x) => Subcategory.fromJson(x)))
          : [],
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'], // <-- Likely culprit if this is null
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      availableColors: json['availableColors'] ?? [],
      imageCover: json['imageCover'],
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      ratingsAverage: json['ratingsAverage']?.toDouble(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  } catch (e, stack) {
    print('Failed to parse Product: $e');
    print('Stack trace: $stack');
    print('Faulty JSON: ${jsonEncode(json)}');
    rethrow;
  }
}

}

class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({
     this.id,
     this.name,
     this.slug,
     this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id']?.toString(),
      name: json['name']?.toString(), // <-- Likely culprit if this is null
      slug: json['slug']?.toString(),
      category: json['category']?.toString(),
    );
  }
}

