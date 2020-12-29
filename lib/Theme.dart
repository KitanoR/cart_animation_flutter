import 'dart:io' show Platform;

import 'package:flutter/material.dart';


const _backgroundColorDark = Color(0xFF16202B);

class ThemeChanger with ChangeNotifier {
  ThemeData _darkThemeData = ThemeData.dark().copyWith(
    primaryColor: Color(0xFFDF665D),
    accentColor: Color(0xFFDF665D),
    scaffoldBackgroundColor: _backgroundColorDark,
    canvasColor: Color(0xFF253441),
    colorScheme: ColorScheme.dark(
      secondaryVariant: Color(0xFFDF665D),
      primary: Color(0xFFDF665D),
      onPrimary: Colors.red,
      primaryVariant: Colors.amber,
      secondary: Colors.green,
      onSecondary: Color(0xFF253441)
    ),
    cardTheme: CardTheme(
      color: Color(0xFF192834)
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        height: .9,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'Nunito',
        color: Colors.white
      ),
      headline6: TextStyle(
        height: .9,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontFamily: 'Nunito',
        color: Colors.white
      ),
      bodyText1: TextStyle(
        height: .9,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: 'Nunito',
        color: Colors.white
      )
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Nunito',
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Nunito',
    ),
  );
  ThemeData _lightThemeData = ThemeData.light().copyWith(
    primaryColor: Color(0xFFDF665D),
    colorScheme: ColorScheme.light(
      onSecondary: Colors.white
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        height: .9,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'Nunito',
        color: Colors.grey
      ),
      headline6: TextStyle(
        height: .9,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontFamily: 'Nunito',
        color: Colors.grey
      ),
      bodyText1: TextStyle(
        height: .9,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: 'Nunito',
        color: Colors.grey
      )
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Nunito',
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Nunito',
    ),
  );

  bool _darkTheme = false;
  ThemeData _currentTheme;
  
  bool get darkTheme => this._darkTheme;
  ThemeData get currentTheme => this._currentTheme;





  ThemeChanger(bool theme) {
    if(theme) {
      // se asinga del darkmode
      _darkTheme = true;
      _currentTheme = _darkThemeData;
    } else {
      _darkTheme = false;
       _currentTheme = _lightThemeData;
    }
  
  }

  set darkTheme(bool valor) {
    _darkTheme = valor;
    if(valor){
      _currentTheme = _darkThemeData;
      print('Dark theme');
    }else{  
      print('Light Themes');
      _currentTheme = _lightThemeData;
    }
    notifyListeners();
  }

  // https://github.com/afgprogrammer/Flutter-page-transition-animation/blob/master/lib/main.dart

  // setisDarkModel(BuildContext context){
  //   var brightness = MediaQuery.of(context).platformBrightness;
  //   bool darkModeOn = brightness == Brightness.dark;
  //   if (Platform.isIOS) {
  //     darkModeOn ? _isInDarkMode = false : _isInDarkMode = true;
  //   } else if (Platform.isAndroid) {
  //     darkModeOn ? _isInDarkMode = true : _isInDarkMode = false;
  //   } else {
  //     _isInDarkMode = false;
  //   }
  // }

}