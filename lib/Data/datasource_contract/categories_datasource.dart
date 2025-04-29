import 'package:ecommerce/Domain/entities/Category.dart';

abstract class CategoriesDataSource {
  Future<List<Category>?> getCategories();
} 