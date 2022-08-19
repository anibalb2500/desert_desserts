import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icecreamapp/view/IceCreamWidget/IceCreamWidgetViewModel.dart';

class IceCreamWidget extends StatelessWidget {
  final IceCreamWidgetViewModel viewModel;

  const IceCreamWidget({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(viewModel.title),
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
          child: Image.asset(viewModel.imageRoute),
        ),
      ),
    ],
    );
  }
}