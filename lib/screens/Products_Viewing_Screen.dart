import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clientapp_project/models/product_details.dart';
import 'package:clientapp_project/widgets/item_card.dart';

class CategoryViewingScreen extends StatelessWidget {
  static const routeName='/Products_Viewing_Screen';
  final String categoryTitle;

  CategoryViewingScreen({this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments as String;

    final providerConnection = Provider.of<Products>(context);
    final List categoryData = providerConnection.findByCategory(args);

    AppBar appBar = AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 7,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      title: Text(args,style:TextStyle(color:Theme.of(context).primaryColor)),
    );
    return Scaffold(

      appBar: appBar,
      body: Container(
       // decoration: BoxDecoration(),
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top - appBar.preferredSize.height),
        child: ListView.builder(
            itemCount: categoryData.length,
            itemBuilder: (ctx, index) => ItemCard(
                title: categoryData[index].productName,
                imgUrl: categoryData[index].imageUrl,
                description: categoryData[index].description,
                quantity: categoryData[index].quantity,
                price: categoryData[index].originalPrice,
                discountAmount: categoryData[index].amountAfterDiscount),),
      ),
    );
  }
}
