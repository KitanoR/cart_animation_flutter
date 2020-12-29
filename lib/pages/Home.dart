import 'package:animacion_cart/models/shoes.dart';
import 'package:animacion_cart/pages/ShoesDetail.dart';
import 'package:animacion_cart/widgets/nike_shoes.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final ValueNotifier<bool> notifierBottonVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoe, BuildContext context) async {
    notifierBottonVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {  
          return FadeTransition(
            opacity: animation,
            child: ShoesDetailPage(shoesItem: shoe,),
          );
        })
    );
    notifierBottonVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
            'assets/img/nike.png', 
            height: 40,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[        
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: shoes.length,
                    itemBuilder: (context, index){
                      final shoesItem = shoes[index];
                      return NikeShoesWidget(shoesItem: shoesItem, onTap: () {
                        _onShoesPressed(shoesItem, context);
                      },);
                    }
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: notifierBottonVisible,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(Icons.home)
                  ),
                  Expanded(
                    child: Icon(Icons.search)
                  ),
                  Expanded(
                    child: Icon(Icons.favorite_border)
                  ),
                  Expanded(
                    child: Icon(Icons.shopping_cart)
                  ),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage: AssetImage('assets/img/adidas-1.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            builder: (BuildContext context, value, Widget child) { 
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                height: kToolbarHeight,
                child: child
              );
            },
          ),
          
        ],
      ),
   );
  }
}