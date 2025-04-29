import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:ecommerce/di/di.dart';
import 'package:flutter/material.dart';

void main (){
  configureDependencies();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeTabView(),
      debugShowCheckedModeBanner: false,
    );
  
  }
}