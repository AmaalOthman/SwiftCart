import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Domain/entities/Brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandItemWidget extends StatelessWidget{
  Brand brand ;
  BrandItemWidget({required this.brand}); 
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: brand.image ?? "",
      imageBuilder: (context, imageProvider) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
            )
          ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      );
  }
  
}