import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Domain/repository/categories_repository.dart';
import 'package:ecommerce/Domain/useCases/get_brands_usecase.dart';
import 'package:ecommerce/Domain/useCases/get_caategories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewmodel extends Cubit<HomeTabState>{
  GetCategoriesUsecase getCategoriesUsecase;
  GetBrandsUsecase getBrandsUsecase;
  @factoryMethod
  HomeTabViewmodel({required this.getCategoriesUsecase , required this.getBrandsUsecase}):super(LoadingState(message: "Loading..."));

  void initPage() async {
    emit(LoadingState(message: "Loading..."));
    try{
      var categories = await getCategoriesUsecase.invoke();
      var brands = await getBrandsUsecase.invoke();
      emit(SuccessState(categories: categories ,brands: brands));
      }catch(e){
      emit(ErrorState(errorMessage: e.toString()));
    }
    
  }


}

sealed class HomeTabState {}
class ErrorState extends HomeTabState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}
class LoadingState extends HomeTabState {
  String message;
  LoadingState({required this.message});
}
class SuccessState extends HomeTabState {
  List<Category>? categories;
  List<Brand>? brands;
  SuccessState({ this.categories ,this.brands});
}