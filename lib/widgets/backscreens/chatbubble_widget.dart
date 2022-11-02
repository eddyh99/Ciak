import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class UsersChatBubble extends StatelessWidget {
  const UsersChatBubble(
      {super.key,
      required this.avatar,
      required this.chat,
      required this.time});

  final Widget avatar;
  final String chat;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: avatar,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.only(top: 2.h),
                  constraints: BoxConstraints(maxWidth: 70.w),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    chat,
                    style: const TextStyle(color: Colors.white70),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OwnChatBubble extends StatelessWidget {
  const OwnChatBubble({super.key, required this.chat, required this.time});

  final String chat;
  final String time;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.only(top: 2.h),
                  constraints: BoxConstraints(maxWidth: 70.w),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    chat,
                    style: const TextStyle(color: Colors.white70),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
