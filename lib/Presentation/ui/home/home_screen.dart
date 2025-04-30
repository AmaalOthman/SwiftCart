import 'package:ecommerce/Presentation/ui/home/home_screen_viewModel.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/categories_tab/categories_screen.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_viewmodel.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/profile_tab/profile_screen.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/wishList_tab/wishList_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget{

  int selectedIndex = 0;
  var viewmodel = HomeScreenViewmodel();
  Widget tabPreview = HomeTabView();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewmodel,HomeScreenState >(
      bloc: viewmodel,
      builder: (context, state) {
        if(state is HomeTabState){
           tabPreview = HomeTabView();
        }
        else if(state is HomeCategoriesTabState){
           tabPreview = CategoriesScreen();
        }
        else if(state is HomeWishlistTabState){
          tabPreview = WishListScreen();
        } else{
          tabPreview = ProfileScreen();
        }
      return Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Ecommerce App"),
          ),
        
          bottomNavigationBar:BottomNavigationBar(
            onTap: (index) {
              selectedIndex = index;
               viewmodel.getTabs(selectedIndex);
            },
            backgroundColor: Colors.green,
            items:[
              BottomNavigationBarItem(
                
                backgroundColor: Colors.green,
                icon: selectedIndex == 0 ?
                  CircleAvatar(child: ImageIcon(AssetImage("assets/images/home.png"))) 
                 :ImageIcon(AssetImage("assets/images/home.png")),label: ""),

              BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: selectedIndex == 1 ?
                  CircleAvatar(child: ImageIcon(AssetImage("assets/images/categories.png")))
                 :ImageIcon(AssetImage("assets/images/categories.png")),label: "Category"),

              BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: selectedIndex == 2 ?
                  CircleAvatar(child: ImageIcon(AssetImage("assets/images/favorite.png")))
                  :ImageIcon(AssetImage("assets/images/favorite.png")),label: "Cart"),
                  
              BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: selectedIndex == 3 ?
                  CircleAvatar(child: ImageIcon(AssetImage("assets/images/profile.png")))
                  :ImageIcon(AssetImage("assets/images/profile.png")),label: "Profile"),
            ] ),
        
          body: tabPreview,
        
        ),
      );
    
      }
    );


  }
}