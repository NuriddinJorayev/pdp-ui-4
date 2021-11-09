import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  final String id = "home_page";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listImage = [
    'assets/images/im_car1.jpg',
    'assets/images/im_car5.jpg',
    'assets/images/im_car3.jpg',
    'assets/images/im_car2.jpg',
    'assets/images/im_car4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Cars",
          style: TextStyle(color: Colors.red, fontSize: 30.0),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.red,
          ),
          SizedBox(width: 20.0),
          Icon(
            Icons.shopping_cart,
            color: Colors.red,
          ),
          SizedBox(width: 15.0),
        ],
        systemOverlayStyle:
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // category panel
              Container(
                height: 40.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _rotioItems("All", true),
                    _rotioItems("Red", false),
                    _rotioItems("Blue", false),
                    _rotioItems("Green", false),
                    _rotioItems("Yellow", false),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // body panel
               Column(
                 children: listImage
                     .map((e) => _listViewItems(
                         MediaQuery.of(context).size.height,
                         e,
                         "PDP Car",
                         "Electric",
                         "100\$"))
                     .toList(),
               ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rotioItems(String name, bool isActive) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isActive ? Colors.red : Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: isActive ? 20 : 17,
                color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
  
  Widget _listViewItems(rout_context, image, name, carType, cost) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: (rout_context / 3.5) - 15,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(18.0)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,

                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.2),

                ]
            )
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // car info: name, cost, type
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      carType,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  cost,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // favorite button panel
            Container(
              margin: EdgeInsets.all(5.0),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red
              ),
              child: Center(
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
