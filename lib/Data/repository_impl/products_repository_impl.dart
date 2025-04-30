import 'package:ecommerce/Data/datasource_contract/products_datasource.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository{
  ProductsDataSource productsDataSource;
  @factoryMethod
  ProductsRepositoryImpl({required this.productsDataSource});
  @override
  Future<List<Product>?> getProducts({ProductSort? sort}) {
    return productsDataSource.getProducts();
  }
}