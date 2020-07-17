import 'package:flutter/cupertino.dart';

class ProductInfo {
  int productId;
  String productName;
  String description;
  String quantity;
  String category;
  double originalPrice;
  double amountAfterDiscount;
  double offPercentage;

  String imageUrl;
  int offerPercentage;

  ProductInfo({
    this.offerPercentage,
    @required this.productName,
    @required this.originalPrice,
    @required this.quantity,
    this.amountAfterDiscount,
    this.offPercentage,
    @required this.category,
    @required this.description,
    @required this.productId,
    @required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<ProductInfo> allProducts = [
    ProductInfo(
      productId: 01,
      productName: 'Mango',
      description: 'Imported Salem Mango',
      quantity: '1',
      category: 'Dry Fruits and Nuts',
      originalPrice: 200,
      amountAfterDiscount: 150,
      imageUrl: 'assets/images/mango.jpg',
    ),
    ProductInfo(
      productId: 02,
      productName: 'Apple',
      description: 'Fresh Apples',
      quantity: '1',
      category: 'Dry Fruits and Nuts',
      originalPrice: 150,
      amountAfterDiscount: 100,
      imageUrl: 'assets/images/apple.jpg',
    ),
    ProductInfo(
      productId: 03,
      productName: 'Carrot',
      description: 'carrot',
      quantity: '1/2',
      category: 'vegetables',
      originalPrice: 55,
      amountAfterDiscount: 50,
      imageUrl: 'assets/images/carrot.jpg',
    ),
    ProductInfo(
      productId: 04,
      productName: 'Cabbage',
      description: 'Green and Fresh Cabbage',
      quantity: '1/2',
      category: 'Vegetables',
      originalPrice: 30,
      imageUrl: 'assets/images/Cauliflower.jpg',
    ),
    ProductInfo(
      productId: 05,
      productName: 'Basmathi Rice',
      description: 'IndiaGate',
      quantity: '1/2',
      category: 'Rice & OtherGrains',
      originalPrice: 250,
      amountAfterDiscount: 200,
      imageUrl: 'assets/images/Basmati_rice.jpg',
    ),
    ProductInfo(
      productId: 06,
      productName: 'Tacoshells',
      quantity: '200',
      category: 'Groseries',
      originalPrice: 250,
      amountAfterDiscount: 200,
      imageUrl: 'assets/images/TacoShells.jpg',
    ),
    ProductInfo(
      productId: 07,
      productName: 'Beans',
      description: 'Packed',
      quantity: '1',
      category: 'Groceries',
      originalPrice: 45,
      amountAfterDiscount: 40,
      imageUrl: 'assets/images/Beans.jpg',
    ),
    ProductInfo(
      productId: 07,
      productName: 'Onion',
      description: 'FreshOnions',
      quantity: '1',
      category: 'Vegetables',
      originalPrice: 80,
      amountAfterDiscount: 10,
      imageUrl: 'assets/images/onion.jpg',
    ),
    ProductInfo(
      productId: 08,
      productName: 'Packed Dhall',
      description: 'Hygenically Packed',
      quantity: '1',
      category: 'Groceries',
      originalPrice: 70,
      amountAfterDiscount: 50,
      imageUrl: 'assets/images/Packed dal.jpg',
    ),
    ProductInfo(
      productId: 09,
      productName: 'Packed',
      description: 'Hygenically',
      quantity: '1/2',
      category: 'Pulses',
      originalPrice: 100,
      amountAfterDiscount: 80,
      imageUrl: 'assets/images/Packed dal.jpg',
    ),
  ];

  List<ProductInfo> get items {
    return [...allProducts];
  }

  List<ProductInfo> findByCategory(String category){
    return allProducts.where((product)=>product.category==category).toList();

  }

}
