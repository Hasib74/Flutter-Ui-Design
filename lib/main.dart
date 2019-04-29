import 'package:flutter/material.dart';
import 'utils.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF696D77),
            Color(0xFF292C77),
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: screenAwareSize(20.0, context),
            ),
            onPressed: () {},
          ),
          title: Text(
            "Apex",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(18.0, context),
              fontFamily: "Montserrat-Bold",
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[ProductScreenTopPart(), ProductScreenBottom()],
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Container(
                  child: Image.asset(
                    "images/s.png",
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, right: 35.5),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: screenAwareSize(50.0, context),
                      height: screenAwareSize(50.0, context),
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Image.asset("images/360.png"),
                    )),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(0.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 5),
                  child: Text(
                    "Rating ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "(278 people)",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottom extends StatefulWidget {
  @override
  _ProductScreenBottomState createState() => _ProductScreenBottomState();
}

class _ProductScreenBottomState extends State<ProductScreenBottom> {



  bool isExpanded=false;

  void _expand(){
    setState(() {
       isExpanded ? isExpanded =false : isExpanded=true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "Product Description",
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: AnimatedCrossFade(
                firstChild: Text(
                  doc,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
                secondChild: Text(doc,
                   // maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    )
                ),
              crossFadeState: isExpanded? CrossFadeState.showSecond:CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: GestureDetector(
                child: Text(isExpanded? "less" : "more..",style: TextStyle(color: Colors.red),),
                onTap: _expand,
            ),
          )
        ],
      ),
    );
  }
}
