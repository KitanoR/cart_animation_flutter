import 'package:animacion_cart/models/shoes.dart';
import 'package:flutter/material.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _imageSize = 130.0;

class AddToCartPage extends StatefulWidget {
  final NikeShoes shoesItem;

  const AddToCartPage({Key key, @required this.shoesItem}) : super(key: key);

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animationResize;
  Animation _animationMovementIn;
  Animation _animationMovementOut;

  @override  void initState() { 
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _animationResize = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve:  Interval(
          0.0,
          0.3
        )
      )
    );
    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve:  Interval(
          0.30,
          0.6,
          curve: Curves.easeIn
        )
      )
    );
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve:  Interval(
          0.6,
          1,
          curve: Curves.elasticIn
        )
      )
    );

    _controller.addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          Navigator.of(context).pop(true);
        }
    });
    super.initState();
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentImageSize = (_imageSize * _animationResize.value).clamp(
      _finalImageSize,
      _imageSize
    );
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInToLinear,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
            child: child, 
            offset: Offset(0.0, value * size.height * 0.6));
      },
      child: Container(
        height: (size.height * 0.60 * _animationResize.value).clamp(
          _buttonCircularSize,
          size.height * 0.6  
        ),
        width: (size.width * _animationResize.value).clamp(
          _buttonCircularSize , 
          size.width
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), 
                topRight: Radius.circular(30),
                bottomLeft: _animationResize.value == 1 ? Radius.circular(0) : Radius.circular(30),
                bottomRight:  _animationResize.value == 1 ? Radius.circular(0) :  Radius.circular(30)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: _animationResize.value == 1 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    widget.shoesItem.images.first,
                    height: currentImageSize,
                  ),
                  if(_animationResize.value == 1) ...[
                    const SizedBox(width: 20),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.shoesItem.model,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '\$${widget.shoesItem.currentPrice.toInt().toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ],
                    )
                  ]
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final buttonResizeWidth =(_buttonSizeWidth * _animationResize.value).clamp(
              _buttonCircularSize, 
              _buttonSizeWidth
            );
            final panelSizeWidth = (size.width * _animationResize.value).clamp(
              _buttonCircularSize,
              size.width
            );
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black45,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: <Widget>[
                      if(_animationMovementIn.value != 1)...[
                        Positioned(
                          top: size.height * 0.4 + (_animationMovementIn.value * size.height * 0.489),
                          left: size.width / 2 - panelSizeWidth / 2,
                          width: panelSizeWidth,
                          child: _buildPanel(context),
                        )
                      ],
                      
                      Positioned(
                        bottom: 40 - (_animationMovementOut.value * 100),
                        left: size.width / 2 - buttonResizeWidth /2,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInToLinear,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                                child: child, offset: Offset(0.0, value * size.height * 0.6));
                          },
                          child: InkWell(
                            onTap: () {
                              _controller.forward();
                            },
                            child: Container(
                              width: buttonResizeWidth,
                              height: (_buttonSizeHeight * _animationResize.value).clamp(_buttonCircularSize, _buttonSizeHeight),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                    if(_animationResize.value == 1) ...[
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add to cart',
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ));
  }
}
