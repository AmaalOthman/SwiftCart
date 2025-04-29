import 'package:ecommerce/Data/api_manager/api_manager.dart';
import 'package:ecommerce/Data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
 
 @Injectable(as: BrandsDataSource)
class BrandsDatasourceImpl extends BrandsDataSource{
  ApiManager apiManager;
  @factory
  BrandsDatasourceImpl({required this.apiManager});

  @override
  Future<List<Brand>?> getBrands()async {
    var response = await apiManager.getBrands();
    return response.data?.map((brandDto)=> brandDto.toBrand()).toList();
  }

}