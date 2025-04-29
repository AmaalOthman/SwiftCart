import 'dart:convert';

import 'package:ecommerce/Data/model/brands_response.dart';
import 'package:ecommerce/Data/model/categories_response.dart';
import 'package:ecommerce/Data/model/products_response.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/products_repository.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  Future<CategoriesResponse> getCategories() async{
    var url = Uri.https(baseUrl, '/api/v1/categories');
    var response = await http.get(url); 
    var json = jsonDecode(response.body);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    return categoriesResponse;
  }


  Future<BrandsResponse> getBrands() async{
    var url = Uri.https(baseUrl, '/api/v1/brands');
    var response = await http.get(url); 
    var json = jsonDecode(response.body);
    BrandsResponse brandsResponse = BrandsResponse.fromJson(json);
    return brandsResponse;
  }

  Future<ProductResponse> getProducts({ProductSort? sort}) async{
    var url = Uri.https(baseUrl, '/api/v1/products', {
      'sort': sort
    });
    var response = await http.get(url); 
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }
}