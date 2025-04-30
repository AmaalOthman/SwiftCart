import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewmodel extends Cubit<HomeScreenState> {
  HomeScreenViewmodel() :super(HomeTabState());

  getTabs(int indexTab){
    if(indexTab == 0){
      emit(HomeTabState());
    }
    if(indexTab == 1){
      emit(HomeCategoriesTabState());
    }
    if(indexTab == 2){
      emit(HomeWishlistTabState());
    }
    if(indexTab == 3){
      emit(HomeProfileTabState());
    }
  }
}



sealed class HomeScreenState {}

class HomeCategoriesTabState extends HomeScreenState {}

class HomeProfileTabState extends HomeScreenState {}

class HomeTabState extends HomeScreenState {}

class HomeWishlistTabState extends HomeScreenState {}