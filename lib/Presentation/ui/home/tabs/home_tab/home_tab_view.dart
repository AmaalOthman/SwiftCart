import 'package:ecommerce/Domain/entities/Category.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/Widgets/brand_item_widget.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/Widgets/category_item_widget.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/Widgets/product_item_widget.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_viewmodel.dart';
import 'package:ecommerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatefulWidget{
  HomeTabViewmodel viewmodel = getIt<HomeTabViewmodel>();
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewmodel viewmodel = getIt<HomeTabViewmodel>();

  @override
  void initState() {
    viewmodel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewmodel, HomeState>(
      bloc: viewmodel,
      builder: (context, state) {
        switch(state){
          case LoadingState(): {
            return Center(child: CircularProgressIndicator(),);
          }
          case ErrorState(): {
            print('Error: ${state.errorMessage}');
            return Center(
              child: Column(
               children: [
                Expanded(child: Text('Error: ${state.errorMessage ?? ""}')),
                
                SizedBox(height: 20,),
                ElevatedButton(
                 onPressed: (){},
                  child: Text('Try Again'),
                )
                ],
            ));
          }
          case SuccessState(): {
            var categories = state.categories;
            var brands = state.brands;
            var products = state.products ?? [];
            
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 18,
                          crossAxisSpacing: 18,
                          childAspectRatio: 1/2
                          ),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories?.length,
                        itemBuilder: (context, index) => CategoryItemWidget(category: categories![index]),
                      ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => BrandItemWidget(brand: brands![index]),
                        itemCount: brands?.length,
                        ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3  ,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductItemWidget(product: products[index]),
                        itemCount: products?.length,
                        ),
                  ),
                ),
              ]
    
            );
          }
        }
      }
    );
  
  }
  }
