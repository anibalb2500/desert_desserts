import 'package:flutter/material.dart';

import 'ConeWidgetViewModel.dart';

class ConeWidget extends StatelessWidget {
  final ConeWidgetViewModel viewModel;

  const ConeWidget({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        clipBehavior: Clip.none, children: <Widget>[
        Wrap(
            children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 63,
                  width: 63,
                  margin: EdgeInsets.only(top: 5),
                  child: Image.asset(viewModel.imageRoute),
                ),
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
                )
              ],
            )],
        ),
      ],
      ),
    );
  }
}