import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final String title;
  final String imgUrl;
  final String description;
  final String quantity;
  final double price;
  final discountAmount;


  ItemCard(
      {@required this.title,
      @required this.imgUrl,
      @required this.description,
      @required this.quantity,
      @required this.price,
      @required this.discountAmount});


  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.006,
          horizontal: MediaQuery.of(context).size.width * 0.020),
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
       // border: Border.all(color: Colors.black),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
          ),
          BoxShadow(
            color: Colors.black12,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: constraints.maxHeight * 0.8,
                  width: constraints.maxWidth * 0.30,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 3,
                  top: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      'Rs   off',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
//            SizedBox(
//              width: constraints.maxWidth * 0.00,
//            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                Text(
                  description==null?' ':'$description ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text('$quantity KG'),
                SizedBox(
                  height: constraints.maxHeight * 0.06,
                ),
                Container(
                  width: constraints.maxWidth * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              discountAmount == null
                                  ? 'Rs $price'
                                  : 'Rs $discountAmount',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: constraints.maxWidth * 0.009),
                            Text(
                              discountAmount == null ? ' ' : ' Rs$price',
                              style: TextStyle(
                                  fontSize: 11,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Card(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: 40,
                          width: 91,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16, bottom: 2),
                                child: Text(
                                  'ADD',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  //margin: EdgeInsets.only(bottom: 9,right: 5),

                                  child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
