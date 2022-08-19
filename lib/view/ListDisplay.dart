import 'package:flutter/material.dart';
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
        height: 300,
        child: new ListView.builder(
            itemCount: lItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctxt, int index){
              if (lItems[index] is IceCreamWidgetViewModel) {
                // return new Text((lItems[index] as IceCreamWidgetViewModel).title);
                return new IceCreamWidget(viewModel: lItems[index] as IceCreamWidgetViewModel,);
              } else {
                // Return empty widget
                return SizedBox.shrink();
              }
            }),
      ),
    );
  }
}