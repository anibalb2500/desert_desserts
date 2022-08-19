import 'package:flutter/material.dart';
import 'package:icecreamapp/view/ConeWidget/ConeWidget.dart';
import 'package:icecreamapp/view/ConeWidget/ConeWidgetViewModel.dart';
import 'package:icecreamapp/view/IceCreamWidget/IceCreamWidgetViewModel.dart';

import 'IceCreamWidget/IceCreamWidget.dart';

class HorizontalListDisplay extends StatefulWidget {
  final List<Object> lItems;

  const HorizontalListDisplay({
    this.lItems
  });

  @override
  State createState () => DynamicList(lItems: lItems);
}

class DynamicList extends State<HorizontalListDisplay> {
  final List<Object> lItems;

  DynamicList({
    this.lItems
  });

  @override
  Widget build (BuildContext ctxt) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: new ListView.builder(
            itemCount: lItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctxt, int index){
              Object item = lItems[index];
              if (lItems[index] is IceCreamWidgetViewModel) {
                return new IceCreamWidget(viewModel: item as IceCreamWidgetViewModel);
              } else if (lItems[index] is ConeWidgetViewModel) {
                return new ConeWidget(viewModel: item as ConeWidgetViewModel);
              } else {
                // Return empty widget
                return SizedBox.shrink();
              }
            }),
      ),
    );
  }
}