import 'package:ecommerce/Data/model/brands_response.dart';
import 'package:ecommerce/Data/model/categories_response.dart';
import 'package:ecommerce/Data/model/paginationDto.dart';
import 'package:ecommerce/Domain/entities/Product.dart';

class ProductResponse {
  final int results;
  final PaginationDto metadata;
  final List<ProductDto> data;

  ProductResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        results: json['results'] ?? 0,
        metadata: PaginationDto.fromJson(json['metadata'] ?? {}),
        data: (json['data'] as List?)?.map((e) => ProductDto.fromJson(e)).toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        'results': results,
        'metadata': metadata.toJson(),
        'data': data.map((e) => e.toJson()).toList(),
      };
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
  final num? ratingsAverage;
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

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        sold: json['sold'],
        images: (json['images'] as List?)?.cast<String>(),
        subcategory: (json['subcategory'] as List?)
            ?.map((e) => SubcategoryDto.fromJson(e))
            .toList(),
        ratingsQuantity: json['ratingsQuantity'],
        id: json['_id'],
        title: json['title'],
        slug: json['slug'],
        description: json['description'],
        quantity: json['quantity'],
        price: json['price'],
        priceAfterDiscount: json['priceAfterDiscount'],
        availableColors: json['availableColors'] as List?,
        imageCover: json['imageCover'],
        category: json['category'] != null 
            ? CategoryDto.fromJson(json['category']) 
            : null,
        brand: json['brand'] != null 
            ? BrandDto.fromJson(json['brand']) 
            : null,
        ratingsAverage: json['ratingsAverage'] as num?,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        'sold': sold,
        'images': images,
        'subcategory': subcategory?.map((e) => e.toJson()).toList(),
        'ratingsQuantity': ratingsQuantity,
        '_id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'quantity': quantity,
        'price': price,
        'priceAfterDiscount': priceAfterDiscount,
        'availableColors': availableColors,
        'imageCover': imageCover,
        'category': category?.toJson(),
        'brand': brand?.toJson(),
        'ratingsAverage': ratingsAverage,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  Product toProduct() {
    try {
      return Product(
        id: id,
        title: title ?? 'Untitled Product',
        slug: slug ?? '',
        description: description ?? '',
        quantity: quantity ?? 0,
        price: price ?? 0,
        priceAfterDiscount: priceAfterDiscount,
        availableColors: availableColors ?? [],
        imageCover: imageCover ?? '',
        category: category?.toCategory(),
        subcategory: subcategory?.map((e) => e.toSubcategory()).toList() ?? [],
        brand: brand?.toBrand(),
        ratingsAverage: ratingsAverage?.toDouble(),
        createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
        updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      );
    } catch (e, stack) {
      print('❌ ProductDto.toProduct() error: $e');
      print('🧵 Stack trace: $stack');
      print('💾 DTO data: ${toJson()}');
      rethrow;
    }
  }
}

class SubcategoryDto {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  SubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) => SubcategoryDto(
        id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'category': category,
      };

  Subcategory toSubcategory() => Subcategory(
        id: id ?? '',
        name: name ?? '',
        slug: slug ?? '',
        category: category ?? '',
      );
}



