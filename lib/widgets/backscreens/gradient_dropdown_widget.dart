import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class GradientDropdownButton extends StatelessWidget {
  const GradientDropdownButton(
      {super.key,
      this.gradient = const LinearGradient(colors: [Colors.red, Colors.orange]),
      required this.items,
      required this.currentValue,
      this.onSelected});

  final LinearGradient gradient;
  final List<Object> items;
  final Object currentValue;
  final Function(Object)? onSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: PopupMenuButton<Object>(
          itemBuilder: (context) {
            return items.map((Object obj) {
              return PopupMenuItem(
                value: obj,
                child: Text(obj.toString()),
              );
            }).toList();
          },
          onSelected: onSelected,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(currentValue.toString()),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
