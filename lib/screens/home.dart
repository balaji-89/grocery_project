import 'package:flutter/material.dart';

import '../widgets/flutter_tab.dart';
import 'package:clientapp_project/screens/Products_Viewing_Screen.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> advertisements = [
    'assets/images/lowprice.jpeg',
    'assets/images/items.jpeg',
    'assets/images/products.jpeg',
    'assets/images/vegetables.jpeg',
  ];
  List<Map<String, String>> gridView = [
    {
      'title': 'Pulses',
      'imgLink': 'assets/images/spicesjpg.jpg',
    },
    {
      'title': 'Vegetables',
      'imgLink': 'assets/images/vegetables.jpg',
    },
    {
      'title': 'Rice & OtherGrains',
      'imgLink': 'assets/images/storefooditems.jpg',
    },
  ];
  List<Map<String, String>> gridViewTwo = [
    {
      'title': 'Spices',
      'imgLink': 'assets/images/masalaItems.jpg',
    },
    {
      'title': 'Dry Fruits and Nuts',
      'imgLink': 'assets/images/Dry_fruits.jpg',
    },
    {
      'title': 'Groceries',
      'imgLink': 'assets/images/WheatPacked.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        'Here is the Location',
        style: TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
    return Scaffold(
      drawer: Drawer(),

      appBar: appBar,
      body: Container(
        height: mediaQuery.size.height -
            (appBar.preferredSize.height - mediaQuery.padding.top),
        child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            children: <Widget>[
              Container(
                color: Theme.of(context).accentColor,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(constraints.maxHeight * 0.013),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2),
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'What are you looking for (eg. mango,onion)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: advertisements.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset(
                                advertisements[index],
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              Container(
                height: constraints.maxHeight * 1,
                child: FlutterTabBar(),
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                height: constraints.maxHeight * 0.78,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                      height: constraints.maxHeight * 0.25,
                      child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: advertisements.length,
                        itemBuilder: (ctx, index) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  advertisements[index],
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
                              height: mediaQuery.size.height * 0.05,
                              width: mediaQuery.size.width,
                              child: Text(
                                'Top Category',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: constraints.maxHeight * 0.2,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (ctx, index) => Container(
                          height: 100,
                          width: constraints.maxWidth * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white30,
                                spreadRadius: 1,
                              )
                            ],
                            border: Border.all(
                              color: Theme.of(context).backgroundColor,
                              width: 2,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 7, horizontal: 2.5),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(CategoryViewingScreen.routeName,arguments: '${gridView[index]['title']}');
                            },
                            child: GridTile(
                              footer: Container(
                                  height: 23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(9),bottomRight:Radius.circular(7) ),
                                    gradient: LinearGradient(
                                        begin: Alignment.center,
                                        colors: [
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.6),
                                          Theme.of(context).accentColor,
                                        ]),
                                    color: Colors.deepOrange,
                                  ),
                                  child: Container(
                                   decoration: BoxDecoration(borderRadius: BorderRadius.only( bottomLeft: Radius.circular(9),bottomRight:Radius.circular(7) ),),
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          '${gridView[index]['title']}',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.2),
                                  child: Image.asset(
                                    '${gridView[index]['imgLink']}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: constraints.maxHeight * 0.2,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (ctx, index) => Container(
                          height: 100,
                          width: constraints.maxWidth * 0.32,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(9),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.white30,
                                spreadRadius: 1,
                              )
                            ],
                            border: Border.all(
                              color: Theme.of(context).backgroundColor,
                              width: 2,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 7, horizontal: 2.5),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(CategoryViewingScreen.routeName,arguments: '${gridViewTwo[index]['title']}');
                            },
                            child: GridTile(
                              footer: Container(
                                  height: 23,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(9),bottomRight:Radius.circular(7) ),


                                    gradient: LinearGradient(
                                        begin: Alignment.center,
                                        colors: [
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.6),
                                          Theme.of(context).accentColor,
                                        ]),
                                    color: Colors.deepOrange,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        '${gridViewTwo[index]['title']}',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  )),
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.2),
                                  child: Image.asset(
                                    '${gridViewTwo[index]['imgLink']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
