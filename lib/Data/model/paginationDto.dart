class PaginationDto {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  PaginationDto({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) {
    return PaginationDto(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'limit': limit,
      'numberOfPages': numberOfPages,
      'nextPage': nextPage,
    };
  }
}