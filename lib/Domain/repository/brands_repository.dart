import 'package:ecommerce/Domain/entities/Brand.dart';

abstract class BrandsRepository {
  Future<List<Brand>?> getBrands();
}