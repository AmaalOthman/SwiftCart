// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_viewmodel.dart';
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Data/api_manager/api_manager.dart' as _i954;
import '../Data/datasource_contract/brands_datasource.dart' as _i4;
import '../Data/datasource_contract/categories_datasource.dart' as _i99;
import '../Data/datasource_contract/products_datasource.dart' as _i621;
import '../Data/datasource_impl/brands_datasource_impl.dart' as _i652;
import '../Data/datasource_impl/categories_datasource_impl.dart' as _i955;
import '../Data/datasource_impl/product_datasource_impl.dart' as _i204;
import '../Data/repository_impl/brands_repository_impl.dart' as _i629;
import '../Data/repository_impl/categories_repository_impl.dart' as _i548;
import '../Data/repository_impl/products_repository_impl.dart' as _i604;
import '../Domain/repository/brands_repository.dart' as _i89;
import '../Domain/repository/categories_repository.dart' as _i171;
import '../Domain/repository/products_repository.dart' as _i645;
import '../Domain/useCases/get_brands_usecase.dart' as _i421;
import '../Domain/useCases/get_caategories_usecase.dart' as _i866;
import '../Domain/useCases/get_products_usecase.dart' as _i368;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i954.ApiManager>(() => _i954.ApiManager());
  gh.factory<_i99.CategoriesDataSource>(
      () => _i955.CategoriesDatasourceImpl(apiManager: gh<_i954.ApiManager>()));
  gh.factory<_i621.ProductsDataSource>(
      () => _i204.ProductsDatasourceImpl(apiManager: gh<_i954.ApiManager>()));
  gh.factory<_i645.ProductsRepository>(() => _i604.ProductsRepositoryImpl(
      productsDataSource: gh<_i621.ProductsDataSource>()));
  gh.factory<_i4.BrandsDataSource>(
      () => _i652.BrandsDatasourceImpl(apiManager: gh<_i954.ApiManager>()));
  gh.factory<_i368.GetProductsUsecase>(() => _i368.GetProductsUsecase(
      productsRepository: gh<_i645.ProductsRepository>()));
  gh.factory<_i171.CategoriesRepository>(() => _i548.CategoriesRepositoryImpl(
      categoriesDataSource: gh<_i99.CategoriesDataSource>()));
  gh.factory<_i866.GetCategoriesUsecase>(() => _i866.GetCategoriesUsecase(
      categoriesRepository: gh<_i171.CategoriesRepository>()));
  gh.factory<_i89.BrandsRepository>(() =>
      _i629.BrandsRepositoryImpl(brandsDataSource: gh<_i4.BrandsDataSource>()));
  gh.factory<_i421.GetBrandsUsecase>(
      () => _i421.GetBrandsUsecase(gh<_i89.BrandsRepository>()));
  gh.factory<HomeTabViewmodel>(() => HomeTabViewmodel(
        getCategoriesUsecase: gh<_i866.GetCategoriesUsecase>(),
        getBrandsUsecase: gh<_i421.GetBrandsUsecase>(),
        getProductsUsecase: gh<_i368.GetProductsUsecase>(),
      ));
  return getIt;
}
