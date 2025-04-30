import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Domain/entities/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget  extends StatelessWidget{
  Product product;
  ProductItemWidget({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(width: 2 , color: Colors.blue)
      ),
      child: Column(
        children: [

          CachedNetworkImage(
            imageUrl: product.imageCover ?? '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, ImageProvider)=> Container(
              width: 191.w,
              height: 128.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ImageProvider)
              ),
            ),
             ),
            Text(product.title ?? 'No Name Product' , maxLines: 2,),

            Row(
              children: [
                Visibility(
                  visible: product.priceAfterDiscount  != null,
                  child: Text(product.priceAfterDiscount.toString() ?? '')),
                  SizedBox(width: 4,),

                  Text(product.price.toString() ?? '',
                  style: product.priceAfterDiscount != null 
                   ? TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough
                        )
                   : TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.none
                   )  
                  )   

              ],
            ),
            Row(
              children: [
                Text('Review ${product.ratingsAverage}'),
                Icon(Icons.star , color: Colors.yellow),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade900
                  ),
                  child: Icon(Icons.add , color: Colors.white , weight: 55,),
                )
              ],
            )
        ],
      ),
    );
  }
}