import 'package:ecommerce/Data/model/paginationDto.dart';
import 'package:ecommerce/Domain/entities/Brand.dart';

class BrandsResponse {
  final int results;
  final PaginationDto metadata;
  final List<BrandDto> data;

  BrandsResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
      results: json['results'],
      metadata: PaginationDto.fromJson(json['metadata']),
      data: List<BrandDto>.from(json['data'].map((x) => BrandDto.fromJson(x))),
    );
  }
}



class BrandDto {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) {
    return BrandDto(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Brand toBrand() {
    return Brand(
    image: image ?? '',
    name: name ?? '',
    slug: slug ?? '',
    id: id ?? '',
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
