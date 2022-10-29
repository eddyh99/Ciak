import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    this.leading,
    this.leadingTitle,
    this.trailingTitle,
    this.messagePreview = const Text(""),
  });

  final Widget? leading;
  final String? leadingTitle;
  final String? trailingTitle;
  final Text? messagePreview;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
