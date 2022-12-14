import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'IceCreamWidgetViewModel.dart';

class IceCreamWidget extends StatelessWidget {
  final IceCreamWidgetViewModel viewModel;

  const IceCreamWidget({
    required this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = viewModel.displaySelected ? Colors.blue : Colors.transparent;
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Text(
                viewModel.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Puffy",
                    color: Colors.white
                ),
              ),
            ),
            Container(
              height: 63,
              width: 63,
              margin: EdgeInsets.only(top: 5),
              child: Image.asset(viewModel.imageRoute),
            )
          ],
        ),
        height: 125,
        width: 130,
        color: backgroundColor,
      ),
    ],
    );
  }
}