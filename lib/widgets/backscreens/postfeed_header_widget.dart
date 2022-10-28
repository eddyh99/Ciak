import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class PostFeedHeader extends StatelessWidget {
  const PostFeedHeader(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle,
      this.trailing = const <Widget>[]});

  final Widget leading;
  final String title;
  final String subtitle;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.fromLTRB(5.w, 0.0, 3.w, 0.0),
      horizontalTitleGap: 2.w,
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Wrap(
        children: trailing,
      ),
    );
  }
}
