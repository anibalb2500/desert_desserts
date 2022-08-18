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
                        // TODO: Show Ice Cream Scroller
                      },
                    )
                  ],
                )
              ],
            )
        )
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