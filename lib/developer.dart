import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  static const routeName = '/developeric';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 0, top: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'DEVELOPER',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ]
                      ),
                    ),
                    DeveloperItem(
                      title: "Ice Cream Scroller",
                      onClick: () {
                        showIceCreamScroller(context);
                      },
                    )
                  ],
                )
              ],
            )
        )
    );
  }
  
  void showIceCreamScroller(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return Container(
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 5, top: 25, bottom: 25),
                    child: Text(
                      "Mix and Match!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Puffy",
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.cancel, color: Colors.black, size: 25,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            Row(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 171,
                  margin: EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      IceCreamWidget(
                        title: 'Vanilla',
                        imageRoute: 'assets/images/vanilla.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IceCreamWidget(
                        title: 'Coconut',
                        imageRoute: 'assets/images/coco.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IceCreamWidget(
                        title: 'Exotic',
                        imageRoute: 'assets/images/exotic.png',
                      ),
                    ],
                  ),
                ),)
            ])
          ],
        ));
    },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        backgroundColor: Colors.orangeAccent,
    );
  }
}

class DeveloperItem extends StatelessWidget {
  final String title;
  final Function() onClick;

  const DeveloperItem({
    this.title,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: <Widget>[
      GestureDetector(
            onTap: () {
              onClick();
            },
            child: Container(
                margin: EdgeInsets.only(right: 5, left: 5, top: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)
                )
              ),
            )
        )
      ]);
    }
}

class IceCreamWidget extends StatelessWidget {
  final String title;
  final String imageRoute;

  const IceCreamWidget({
    this.title,
    this.imageRoute
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title),
          ],
        ),
        height: 125,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
      ),
      Positioned(
        left: 70,
        bottom: 81,
        child: Container(
          height: 63,
          width: 63,
          child: Image.asset(imageRoute),
        ),
      ),
    ],
    );
  }
}