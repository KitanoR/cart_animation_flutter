import 'package:flutter/material.dart';

class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeShoes({ 
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.images,
    this.modelNumber,
    this.color
  });
}

final shoes = <NikeShoes> [
  NikeShoes(
    model: 'Air Max 90 EZ Blue',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/img/azul-1.png',
      'assets/img/azul-2.png',
      'assets/img/azul-3.png',
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6
  ),
  NikeShoes(
    model: 'Air Max 90 EZ Nike',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/img/adidas-1.png',
      'assets/img/adidas-2.png',
      'assets/img/adidas-3.png',
    ],
    modelNumber: 90,
    color: 0xFFFCF5EB
  ),
  NikeShoes(
    model: 'Air Max 90 EZ Black',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/img/negro-1.png',
      'assets/img/negro-2.png',
      'assets/img/negro-3.png',
    ],
    modelNumber: 90,
    color: 0xFFEDF3FE
  ),
  NikeShoes(
    model: 'Air Max 90 EZ Other',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/img/adidas-1.png',
      'assets/img/adidas-2.png',
      'assets/img/adidas-3.png',
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6
  ),
  NikeShoes(
    model: 'Air Max 560 EZ Black',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/img/azul-1.png',
      'assets/img/azul-2.png',
      'assets/img/azul-3.png',
    ],
    modelNumber: 90,
    color: 0xFFFCF5EB
  )
];