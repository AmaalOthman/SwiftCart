import 'package:ecommerce/Data/model/paginationDto.dart';
import 'package:ecommerce/Domain/entities/Category.dart';

class CategoriesResponse {
  final int results;
  final PaginationDto metadata;
  final List<CategoryDto> data;

  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'] as int,
      metadata: PaginationDto.fromJson(json['metadata']),
      data: List<CategoryDto>.from(json['data'].map((item) => CategoryDto.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}



class CategoryDto {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
  Category toCategory(){
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image);
  }
}