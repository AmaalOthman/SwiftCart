import 'package:ecommerce/Domain/entities/Product.dart';

abstract class ProductsRepository {
  Future<List<Product>?> getProducts({ProductSort? sort});
}

enum ProductSort{
  mostSelling('-sold'),
  highestPrice('-price');

  final String value;
  const ProductSort(this.value);

}