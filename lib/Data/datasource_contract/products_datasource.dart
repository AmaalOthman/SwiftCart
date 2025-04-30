import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/products_repository.dart';

abstract class ProductsDataSource {
  Future<List<Product>?> getProducts({ProductSort? sort});
  
}