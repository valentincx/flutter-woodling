import 'package:flutter/material.dart';

class Product {
  final int id, price;
  final String title, description, designer, is360;
  final List<String> images;
  final bool isFavourite, isPopular, isDeliverable, isGuaranteed, isAssembled, isPickUp;

  Product({
    @required this.id,
    @required this.images,
    this.isFavourite = false,
    this.isPopular = false,
    this.isDeliverable = false,
    this.isGuaranteed = false,
    this.isAssembled = false,
    this.isPickUp = false,
    this.is360 = "",
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.designer,
  });

}

List<Product> demoProducts = [
  Product(
      id: 1,
      images: [
        "assets/images/n42_chair_replica/1.png",
        "assets/images/n42_chair_replica/2.png",
        "assets/images/n42_chair_replica/4.png",
        "assets/images/n42_chair_replica/6.png",
      ],
      title: "No. 42 Chair",
      price: 230,
      isFavourite: true,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "n42_chair_replica",
      designer: "Kai Kristiansen",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 2,
      images: [
        "assets/images/kennedy_chair/1.png",
        "assets/images/kennedy_chair/2.png",
        "assets/images/kennedy_chair/4.png",
        "assets/images/kennedy_chair/6.png",
      ],
      title: "Kennedy Chair",
      price: 400,
      isFavourite: false,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "kennedy_chair",
      designer: "Hans Wegner",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 3,
      images: [
        "assets/images/peacock_chair/1.png",
        "assets/images/peacock_chair/2.png",
        "assets/images/peacock_chair/4.png",
        "assets/images/peacock_chair/6.png",
      ],
      title: "PP 550 Peacock Chair",
      price: 875,
      isFavourite: true,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "peacock_chair",
      designer: "Hans Wegner",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 4,
      images: [
        "assets/images/wishbone_chair/1.png",
        "assets/images/wishbone_chair/2.png",
        "assets/images/wishbone_chair/4.png",
        "assets/images/wishbone_chair/6.png",
      ],
      title: "Wishbone Chair",
      price: 340,
      isFavourite: false,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "wishbone_chair",
      designer: "Hans Wegner",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 5,
      images: [
        "assets/images/dcw_chair/1.png",
        "assets/images/dcw_chair/2.png",
        "assets/images/dcw_chair/4.png",
        "assets/images/dcw_chair/6.png",
      ],
      title: "DCW Chair",
      price: 300,
      isFavourite: false,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "dcw_chair",
      designer: "Charles Eames",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 6,
      images: [
        "assets/images/conference_side_chair/1.png",
        "assets/images/conference_side_chair/2.png",
        "assets/images/conference_side_chair/4.png",
        "assets/images/conference_side_chair/6.png",
      ],
      title: "Conference Side Chair",
      price: 420,
      isFavourite: true,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "conference_side_chair",
      designer: "Eero Saarinen",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 7,
      images: [
        "assets/images/lounge_chair/1.png",
        "assets/images/lounge_chair/2.png",
        "assets/images/lounge_chair/5.png",
      ],
      title: "CH25 Lounge Chair",
      price: 700,
      isFavourite: false,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      designer: "Hans Wegner",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
  Product(
      id: 8,
      images: [
        "assets/images/ch23_chair/1.png",
        "assets/images/ch23_chair/2.png",
        "assets/images/ch23_chair/4.png",
        "assets/images/ch23_chair/6.png",
      ],
      title: "CH23 Chair",
      price: 325,
      isFavourite: true,
      isDeliverable: true,
      isGuaranteed: true,
      isAssembled: true,
      isPickUp: true,
      is360: "ch23_chair",
      designer: "Hans Wegner",
      description: "This chair is a perfect addition to your home. Crafted from a oakwood frame and upholstery with fabric. The thick padded seat and bring you a comfortable and enjoyable user experience. It's ideal for your living room."
  ),
];

