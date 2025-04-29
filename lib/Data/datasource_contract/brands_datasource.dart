import 'package:ecommerce/Domain/entities/Brand.dart';

abstract class BrandsDataSource {
  Future<List<Brand>?> getBrands();
}