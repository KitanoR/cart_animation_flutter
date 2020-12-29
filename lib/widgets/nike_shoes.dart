import 'package:animacion_cart/models/shoes.dart';
import 'package:flutter/material.dart';


class NikeShoesWidget extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback onTap;

  NikeShoesWidget({
    Key key,
    this.shoesItem,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    const itemHeigth = 290.0;

    return InkWell(
        onTap: onTap,
        child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeigth,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: "background-${shoesItem.model}",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(shoesItem.color)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: "number-${shoesItem.model}",
                  child: SizedBox(
                    height: itemHeigth * 0.7,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          shoesItem.modelNumber.toString(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.05)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: itemHeigth * 0.65,
                top: 20,
                left: 100,
                child: Hero(
                  tag: "image-${shoesItem.model}",
                  child: Image.asset(
                    shoesItem.images.first,
                    fit: BoxFit.contain
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      shoesItem.model,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "\$${shoesItem.oldPrice.toInt().toString()}",
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "\$${shoesItem.currentPrice.toInt().toString()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}