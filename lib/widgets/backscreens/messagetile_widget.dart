import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    this.messageKey,
    this.leading,
    this.leadingTitle,
    this.trailingTitle,
    this.messagePreview = const Text(""),
    this.onPinned,
    this.onDeleted,
  });

  final int? messageKey;
  final Widget? leading;
  final String? leadingTitle;
  final String? trailingTitle;
  final Text? messagePreview;
  final Function(BuildContext)? onPinned;
  final Function(BuildContext)? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(messageKey ?? randomNumber()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPinned,
            backgroundColor: Colors.red,
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: Icons.push_pin_outlined,
          ),
          SlidableAction(
            onPressed: onDeleted,
            backgroundColor: Colors.grey,
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: ListTile(
        leading: leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leadingTitle ?? "",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
            ),
            Text(
              trailingTitle ?? "",
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        subtitle: messagePreview,
      ),
    );
  }
}
