import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'Swapper/ConeWidget/ConeWidget.dart';
import 'Swapper/ConeWidget/ConeWidgetViewModel.dart';
import 'Swapper/IceCreamWidget/IceCreamWidget.dart';
import 'Swapper/IceCreamWidget/IceCreamWidgetViewModel.dart';

class HorizontalListDisplay extends StatefulWidget {
  final List<Object> lItems;

  const HorizontalListDisplay({
    this.lItems
  });

  @override
  State createState () => DynamicList(lItems: lItems);

  void onScrollEnded(ScrollEndNotification endNotification) {
    print("Update display");
  }
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
        child: InViewNotifierList(
          isInViewPortCondition: (double deltaLeft, double deltaRight, double viewPortDimension) {
            return deltaLeft < (0.5 * viewPortDimension) && deltaRight > (0.5 * viewPortDimension);
          },
          scrollDirection: Axis.horizontal,
          itemCount: lItems.length,
          builder: (BuildContext context, int index) {
              Object item = lItems[index];
              if (lItems[index] is IceCreamWidgetViewModel) {
                return InViewNotifierWidget(
                  id: '$index',
                  builder: (BuildContext context, bool isInView, Widget child) {
                    (item as IceCreamWidgetViewModel).displaySelected = isInView;
                    return IceCreamWidget(viewModel: item as IceCreamWidgetViewModel);
                  },
                );
              } else if (lItems[index] is ConeWidgetViewModel) {
                return InViewNotifierWidget(
                  id: '$index',
                  builder: (BuildContext context, bool isInView, Widget child) {
                    (item as ConeWidgetViewModel).displaySelected = isInView;
                    return ConeWidget(viewModel: item as ConeWidgetViewModel);
                  },
                );
              } else {
                // Return empty widget
                return SizedBox.shrink();
              }
          }
        ),
      ),
    );
  }
}