import 'package:animacion_cart/Theme.dart';
import 'package:animacion_cart/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(false),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike demo',
      theme: appTheme.currentTheme,
      home: HomePage()
    );
  }
}
