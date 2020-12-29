import 'package:animacion_cart/models/shoes.dart';
import 'package:animacion_cart/pages/AddToCart.dart';
import 'package:animacion_cart/widgets/ShakeTransition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme.dart';

class ShoesDetailPage extends StatelessWidget {
  // final NikeShoes shoesItem;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);
  final NikeShoes shoesItem;

  ShoesDetailPage({Key key, @required this.shoesItem});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    Future<void> _openShoppingCart(BuildContext context) async {
      notifierButtonsVisible.value = false;
      await Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { 
            return FadeTransition(
              opacity: animation,
              child: AddToCartPage(shoesItem: shoesItem,),
            );
          })
      );  
      notifierButtonsVisible.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.asset(
          'assets/img/nike.png',
          height: 40,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCarrousel(size),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ShakeTransition(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              shoesItem.model,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "\$${shoesItem.oldPrice}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough
                                  ),
                                ),
                                Text(
                                  "\$${shoesItem.currentPrice}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                    ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: Text(
                                          'AVAILABLE SIZES',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _TallasZapatoItem(text: '6',),
                            _TallasZapatoItem(text: '7',),
                            _TallasZapatoItem(text: '8',),
                            _TallasZapatoItem(text: '9',),
                            _TallasZapatoItem(text: '10',),
                            _TallasZapatoItem(text: '11',),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: Text(
                          'DESCRIPTION',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 20),


                    ],
                  )
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: notifierButtonsVisible,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'fav_1',
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  FloatingActionButton(
                    heroTag: 'fav_2',
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      _openShoppingCart(context);
                    },
                  )
                ],
              ),
            ),
            builder: (BuildContext context, value, Widget child) {
              return AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  left: 0,
                  right: 0,
                  bottom: value ? 0 : -kToolbarHeight * 1.5,
                  child: child);
            },
          )
        ],
      ),
    );
  }

  _buildCarrousel(Size size) {
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: "background-${shoesItem.model}",
              child: Container(
                color: Color(shoesItem.color),
              ),
            ),
          ),
          Positioned(
            left: 70,
            right: 70,
            top: 10,
            child: Hero(
              tag: "number-${shoesItem.model}",
              child: ShakeTransition(
                axis: Axis.vertical,
                duration: const Duration(milliseconds: 1900),
                offset: 10,
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      shoesItem.modelNumber.toString(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.05),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: shoesItem.images.length,
            itemBuilder: (BuildContext context, int index) {
              final tag = index == 0 ? 'image-${shoesItem.model}' : 'image-${shoesItem.model}_$index';
              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  duration: index == 0 ? const Duration(milliseconds: 900) : Duration.zero,
                  axis: Axis.vertical,
                  offset: 10,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      shoesItem.images[index],
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}


class _TallasZapatoItem extends StatelessWidget {
  final String text;

  _TallasZapatoItem({
    Key key,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "US $text",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11
          ),
        ),
    );
  }
}
