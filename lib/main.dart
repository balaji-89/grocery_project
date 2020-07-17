import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'package:clientapp_project/screens/home.dart';
import 'package:clientapp_project/screens/cart.dart';
import 'package:clientapp_project/screens/category_screen.dart';
import 'package:clientapp_project/screens/notification.dart';
import 'package:clientapp_project/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:clientapp_project/models/product_details.dart';
import 'package:clientapp_project/screens/Products_Viewing_Screen.dart';

import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Project());

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int selectedPage = 0;
  final screens = [
    MyHome(),
    SearchScreen(),
    CategoryScreen(),
    NotificationScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp( routes: {
        CategoryViewingScreen.routeName:(context)=>CategoryViewingScreen(),
      },
        title: 'MyFirstProject',
        theme: ThemeData(
          textTheme: TextTheme(
            body1: GoogleFonts.lato(),
          ),
          accentColor: Color.fromRGBO(217, 167, 132, 2),
          backgroundColor: Colors.white,
          primaryColor: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BubbleBottomBar(
              currentIndex: selectedPage,
              onTap: (int index) {
                setState(() {
                  selectedPage = index;
                });
              },
              opacity: .8,
              backgroundColor: Colors.white.withOpacity(0.8),
              elevation: 7,
              iconSize: 22,
              items: <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(
                    Icons.border_all,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Category',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeIcon: Icon(
                    Icons.border_all,
                    color: Colors.white,
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  title: FittedBox(
                      child: Text(
                    'Notify',
                    style: TextStyle(color: Colors.white),
                  )),
                  activeIcon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: screens[selectedPage],
          ),
        ),
      ),
    );
  }
}
