import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> advertisements = [
    'assets/images/lowprice.jpeg',
    'assets/images/items.jpeg',
    'assets/images/products.jpeg',
    'assets/images/vegetables.jpeg',
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
        color: Colors.black54,
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
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
                  height: 150,
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
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: mediaQuery.size.height * 0.5,
                  child: DefaultTabController(
                      length: 4,
                      child: Column(
                        children: <Widget>[
                          Container(

                            child: TabBar(
                              indicatorWeight: 3,
                              indicatorColor: Theme.of(context).primaryColor,
                              isScrollable: true,
                              labelColor: Theme.of(context).primaryColor,
                              unselectedLabelColor: Colors.black,
                              tabs: <Tab>[
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
                          ),
                          SizedBox(
                            height: 287,
                            child: TabBarView(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      child: Image.asset(
                                          'assets/images/items.jpeg'),
                                      height: mediaQuery.size.height * 0.4,
                                      color: Colors.black,
                                    )),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(color: Colors.blue)),
                                Container(color: Colors.green),
                                Container(
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
