import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUsecase {
  ProductsRepository productsRepository;
  @factoryMethod
  GetProductsUsecase({required this.productsRepository});
  Future<List<Product>?> invoke(){
    return productsRepository.getProducts();
  }
}