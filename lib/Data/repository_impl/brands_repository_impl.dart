import 'package:ecommerce/Data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:ecommerce/Domain/repository/brands_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository {
  BrandsDataSource brandsDataSource;
  @factoryMethod
  BrandsRepositoryImpl({required this.brandsDataSource});
  @override
  Future<List<Brand>?> getBrands() {
    return brandsDataSource.getBrands();
  }
}