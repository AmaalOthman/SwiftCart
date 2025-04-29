import 'package:ecommerce/Data/model/brands_response.dart';
import 'package:ecommerce/Data/model/categories_response.dart';
import 'package:ecommerce/Data/model/paginationDto.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Domain/entities/Category.dart';

class ProductResponse {
  final int results;
  final PaginationDto metadata;
  final List<ProductDto> data;

  ProductResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json['results'],
      metadata: PaginationDto.fromJson(json['metadata']),
      data: List<ProductDto>.from(json['data'].map((item) => ProductDto.fromJson(item))),
    );
  }
}

class ProductDto {
  final int? sold;
  final List<String>? images;
  final List<SubcategoryDto>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;
  final String? imageCover;
  final CategoryDto? category;
  final BrandDto? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  ProductDto({
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

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      sold: json['sold'],
      images: List<String>.from(json['images']),
      subcategory: List<SubcategoryDto>.from(
          json['subcategory'].map((item) => SubcategoryDto.fromJson(item))),
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
      category: CategoryDto.fromJson(json['category']),
      brand: BrandDto.fromJson(json['brand']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      availableColors: availableColors,
      imageCover: imageCover,
      category: category!.toCategory(),
      subcategory: subcategory?.map((e) => e.toSubcategory()).toList(),
      brand: brand!.toBrand(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
    );
  }
}

class SubcategoryDto {
  final String id;
  final String name;
  final String slug;
  final String category;

  SubcategoryDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) {
    return SubcategoryDto(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }

  Subcategory toSubcategory() {
    return Subcategory(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  } 
}



