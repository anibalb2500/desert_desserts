import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'Swapper/ConeWidget/ConeWidget.dart';
import 'Swapper/ConeWidget/ConeWidgetViewModel.dart';
import 'Swapper/IceCreamWidget/IceCreamWidget.dart';
import 'Swapper/IceCreamWidget/IceCreamWidgetViewModel.dart';

class HorizontalListDisplay<T> extends StatefulWidget {
  final List<Object> lItems;
  final Function(T? viewModel) onUpdateSelected;

  const HorizontalListDisplay({
    required this.lItems,
    required this.onUpdateSelected
  });

  @override
  State createState () => DynamicList(
    lItems: lItems,
    onUpdateSelected: onUpdateSelected
  );

  void onScrollEnded(ScrollEndNotification endNotification) {
    print("Update display");
  }
}

class DynamicList<T> extends State<HorizontalListDisplay> {
  final List<Object> lItems;
  final Function(T? viewModel) onUpdateSelected;

  DynamicList({
    required this.lItems,
    required this.onUpdateSelected
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
                  builder: (BuildContext context, bool isInView, Widget? child) {
                    if ((item as IceCreamWidgetViewModel).displaySelected && !isInView) {
                      onUpdateSelected(null);
                    }
                    if (isInView) {
                      onUpdateSelected(item as T);
                    }
                    item.displaySelected = isInView;
                    return IceCreamWidget(viewModel: item);
                  },
                );
              } else if (lItems[index] is ConeWidgetViewModel) {
                return InViewNotifierWidget(
                  id: '$index',
                  builder: (BuildContext context, bool isInView, Widget? child) {
                    if ((item as ConeWidgetViewModel).displaySelected && !isInView) {
                      onUpdateSelected(null);
                    }
                    if (isInView) {
                      onUpdateSelected(item as T);
                    }
                    item.displaySelected = isInView;
                    return ConeWidget(viewModel: item);
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