import 'package:ecommerce/Domain/entities/Category.dart';

abstract class CategoriesRepository {
  Future<List<Category>?> getCategories();
}