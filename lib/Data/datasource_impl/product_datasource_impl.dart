import 'dart:convert';

import 'package:ecommerce/Data/api_manager/api_manager.dart';
import 'package:ecommerce/Data/datasource_contract/products_datasource.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : ProductsDataSource )
class ProductsDatasourceImpl extends ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDatasourceImpl({required this.apiManager});
  @override
  Future<List<Product>?> getProducts({ProductSort? sort}) async{
    try {
    var response = await apiManager.getProducts();
    print('Raw API Response: ${response.data}');
    
    return response.data?.map((productDto) {
      // Now this will work:
      print('Parsing DTO: ${productDto.toJson()}'); 
      return productDto.toProduct();
    }).toList();
  } catch (e, stack) {
    print('Error in getProducts: $e');
    print('Stack trace: $stack');
    rethrow;
  }}
}