import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  // functional requirements
  // businessLogic

  CategoriesRepository categoriesRepository;
  @factoryMethod
  GetCategoriesUsecase({required this.categoriesRepository}); 


  Future<List<Category>?> invoke(){
     return categoriesRepository.getCategories();

  }
  
  }