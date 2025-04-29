import 'package:ecommerce/Data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesDataSource categoriesDataSource;
  @factoryMethod

  CategoriesRepositoryImpl({required this.categoriesDataSource});
  @override
  Future<List<Category>?> getCategories() {
    return categoriesDataSource.getCategories();
  }

}