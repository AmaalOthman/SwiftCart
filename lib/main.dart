import 'package:ecommerce/Presentation/ui/home/home_screen.dart';
import 'package:ecommerce/Presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:ecommerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main (){
  configureDependencies();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  
  }
}