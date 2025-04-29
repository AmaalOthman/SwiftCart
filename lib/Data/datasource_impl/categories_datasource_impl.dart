import 'package:ecommerce/Data/api_manager/api_manager.dart';
import 'package:ecommerce/Data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce/Data/model/categories_response.dart';
import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : CategoriesDataSource)
class CategoriesDatasourceImpl extends CategoriesDataSource{
  ApiManager apiManager;
  @factoryMethod
  CategoriesDatasourceImpl({required this.apiManager});

  @override
  Future<List<Category>?> getCategories() async{
    var response = await apiManager.getCategories();
    return response.data.map((catDto) => CategoryDto.toCategory()).toList();
    
  }
}