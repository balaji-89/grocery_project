import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clientapp_project/models/product_details.dart';
import 'package:clientapp_project/widgets/item_card.dart';

class FlutterTabBar extends StatefulWidget {
  @override
  _FlutterTabBarState createState() => _FlutterTabBarState();
}

class _FlutterTabBarState extends State<FlutterTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: LayoutBuilder(builder: (context,constraints)=>Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:constraints.maxHeight*0.0040),

              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2),
              ], color: Colors.white),
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      indicatorWeight: 3,
                      indicatorColor: Theme.of(context).primaryColor,
                      isScrollable: true,
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          child: Text('TOP SELLING'),
                        ),
                        Tab(
                          child: Text('RECENT'),
                        ),
                        Tab(
                          child: Text('DEALS OF THE DAY'),
                        ),
                        Tab(
                          child: Text('WHAT \'S NEW'),
                        )
                      ],
                    ),
                    Container(

                      height: MediaQuery.of(context).size.height*0.63,
                      child: TabBarView(
                        children: <Widget>[
                          Container(height: 300, child: TopSelling()),
                          Container(color: Colors.blue),
                          Container(color: Colors.green),
                          Container(
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        ),
      ),
    );
  }
}

class TopSelling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerConnection = Provider.of<Products>(context);
    final recentData = providerConnection.items;


    return Container(

      color: Theme.of(context).accentColor,
      child: Column(

        children: [Container(

          height: MediaQuery.of(context).size.width*1,
          child: ListView.builder(physics:NeverScrollableScrollPhysics(),itemCount:3,itemBuilder: (context, index) {
            return ItemCard(description: recentData[index].description,
                title: recentData[index].productName,
                imgUrl: recentData[index].imageUrl,
                quantity: recentData[index].quantity,
                price: recentData[index].originalPrice,
                discountAmount: recentData[index].amountAfterDiscount);
          }),
        ),
          SizedBox(height: 3,),
          Container(
            margin:EdgeInsets.only(top:3),
            decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.all(Radius.circular(12))),
            height:50 ,
            width: MediaQuery.of(context).size.width*0.95,
            child: FlatButton(
              onPressed: (){},
              splashColor: Colors.white,

              child: Text(
                'View All',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
