import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:ecommerce/Domain/repository/categories_repository.dart';
import 'package:ecommerce/Domain/useCases/get_brands_usecase.dart';
import 'package:ecommerce/Domain/useCases/get_caategories_usecase.dart';
import 'package:ecommerce/Domain/useCases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewmodel extends Cubit<HomeState>{
  GetCategoriesUsecase getCategoriesUsecase;
  GetBrandsUsecase getBrandsUsecase;
  GetProductsUsecase getProductsUsecase;
  @factoryMethod
  HomeTabViewmodel({required this.getCategoriesUsecase , required this.getBrandsUsecase , required this.getProductsUsecase}):super(LoadingState(message: "Loading..."));

  void initPage() async {
    emit(LoadingState(message: "Loading..."));
    try{
      var categories = await getCategoriesUsecase.invoke();
      var brands = await getBrandsUsecase.invoke();
      //var products = await getProductsUsecase.invoke();
      emit(SuccessState(
        categories: categories ,
        brands: brands ,
       // products: products 
        ));
      }catch(e){
        print('❌ HomeTabViewModel initPage error: $e');
        print('🧵 Stack trace: $state');
      emit(ErrorState(errorMessage: e.toString()));
    }
    
  }


}

sealed class HomeState {}
class ErrorState extends HomeState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}
class LoadingState extends HomeState {
  String? message;
  LoadingState({this.message});
}
class SuccessState extends HomeState {
  List<Category>? categories;
  List<Brand>? brands;
  List<Product>? products;
  SuccessState({ this.categories ,this.brands , 
   this.products
   });
}