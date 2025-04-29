import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:ecommerce/Domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUsecase {
  BrandsRepository brandsRepository;
  @FactoryMethod()
  GetBrandsUsecase(this.brandsRepository);
  Future<List<Brand>?> invoke(){
    return brandsRepository.getBrands();
  }
}