import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icecreamapp/utils/ViewUtils.dart';
import 'package:icecreamapp/view/ListDisplay.dart';
import 'package:icecreamapp/view/Swapper/ConeWidget/ConeWidgetViewModel.dart';
import 'package:icecreamapp/view/Swapper/IceCreamWidget/IceCreamWidgetViewModel.dart';

class Developer extends StatelessWidget {
  static const routeName = '/developeric';
  IceCreamWidgetViewModel? iceCreamWidgetViewModel;
  ConeWidgetViewModel? coneWidgetViewModel;
  bool showActionButton = false;
  late ActionButton actionButton;

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
        height: MediaQuery.of(context).size.height * .7,
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
              HorizontalListDisplay<IceCreamWidgetViewModel>(
                lItems: _getIceCreamWidgetViewModels(),
                onUpdateSelected: (viewModel) => {
                  updateSelectedIceCream(viewModel)
                },
              )
            ],),
            SizedBox(height: 10),
            Row(children: [
              HorizontalListDisplay<ConeWidgetViewModel>(
                lItems: _getConeWidgetViewModels(),
                onUpdateSelected: updateSelectedCone,
              )
            ],),
            actionButton = ActionButton()
          ],
        ));
    },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        backgroundColor: Color(ViewUtils.colorFromHex("#f6acb0")),
    );
  }

  List<IceCreamWidgetViewModel> _getIceCreamWidgetViewModels() {
    // Temporarily hard coded. Need to add service class to retrieve dynamically
    return [
      IceCreamWidgetViewModel("Vanilla", "assets/images/vanilla.png"),
      IceCreamWidgetViewModel("Coconut", "assets/images/coco.png"),
      IceCreamWidgetViewModel("Strawberry", "assets/images/exotic.png"),
      IceCreamWidgetViewModel("Chocolate", "assets/images/vanilla.png"),
      IceCreamWidgetViewModel("Mint", "assets/images/coco.png"),
      IceCreamWidgetViewModel("Rocky Road", "assets/images/exotic.png"),
      IceCreamWidgetViewModel("Neapolitan", "assets/images/vanilla.png"),
      IceCreamWidgetViewModel("Pepsi Max", "assets/images/coco.png"),
      IceCreamWidgetViewModel("Cookie Dough", "assets/images/exotic.png"),
    ];
  }

  List<ConeWidgetViewModel> _getConeWidgetViewModels() {
    // Temporarily hard coded. Need to add service class to retrieve dynamically
    return [
      ConeWidgetViewModel("Soft Serve Small", "assets/images/vanilla.png"),
      ConeWidgetViewModel("Soft Serve Medium", "assets/images/vanilla.png"),
      ConeWidgetViewModel("Waffle Medium", "assets/images/vanilla.png"),
      ConeWidgetViewModel("Waffle Large", "assets/images/vanilla.png"),
      ConeWidgetViewModel("Sugar Medium", "assets/images/vanilla.png"),
      ConeWidgetViewModel("Sugar Large", "assets/images/vanilla.png"),
    ];
  }

  void updateSelectedIceCream(IceCreamWidgetViewModel? viewModel) {
    iceCreamWidgetViewModel = viewModel;
    actionButton.updateVisibility(iceCreamWidgetViewModel != null && coneWidgetViewModel != null);
  }

  void updateSelectedCone(ConeWidgetViewModel? viewModel) {
    coneWidgetViewModel = viewModel;
    actionButton.updateVisibility(iceCreamWidgetViewModel != null && coneWidgetViewModel != null);
  }
}

class DeveloperItem extends StatelessWidget {
  final String title;
  final Function() onClick;

  const DeveloperItem({
    required this.title,
    required this.onClick,
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

class ActionButton extends StatefulWidget {

  StatefulActionButton? _statefulActionButton;

  @override
  StatefulActionButton createState() {
    _statefulActionButton = StatefulActionButton();
    return _statefulActionButton!;
  }

  void updateVisibility(bool isVisible) {
    _statefulActionButton?.updateVisibility(isVisible);
  }
}

class StatefulActionButton extends State<ActionButton> {

  bool showActionButton = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showActionButton,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Gradient'),
            ),
          ],
        ),
      ),
    );
  }

  void updateVisibility(bool isVisible) {
    bool refresh = showActionButton != isVisible;
    showActionButton = isVisible;
    if (refresh) {
      Future.delayed(Duration.zero, () async {
        setState(() {});
      });
    }
  }
}