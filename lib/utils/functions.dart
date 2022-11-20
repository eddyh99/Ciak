import 'dart:math';

import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:ciak_live/widgets/backscreens/posts_shimmer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

void printDebug(Object object) {
  if (kDebugMode) {
    print(object);
  }
}

Widget postShimmer(Widget returnWidget,
    {Future<dynamic>? future, bool isMedia = false}) {
  return FutureBuilder(
    future: future ?? Future.delayed(const Duration(seconds: 3), () {}),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return returnWidget;
      }
      return PostShimmer(
        isMedia: isMedia,
      );
    },
  );
}

Future<bool> openMailApp() async {
  var result = await OpenMailApp.openMailApp();
  if (!result.canOpen && !result.didOpen) {
    return false;
  }
  return true;
}

int randomNumber() {
  int min = 1000;
  int max = 9999;
  final rnd = Random();
  int r = min + rnd.nextInt(max - min);
  return r;
}

void showUserSubscriptionBottomSheet(
    {required BuildContext context,
    required String subscriptionText,
    VoidCallback? onConfirm}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 30.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
              ),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              leading: const Icon(Icons.check),
              title: Text.rich(
                TextSpan(children: [
                  const TextSpan(text: "Subscription period "),
                  TextSpan(
                      text: subscriptionText,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                ]),
              ),
            ),
            const ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.check),
              title: Text("Full access to private content"),
            ),
            SizedBox(
              height: 2.h,
            ),
            ElevatedButton(
              onPressed: onConfirm,
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    },
  );
}

void showContentBottomSheet(
    {required BuildContext context,
    required String price,
    required String text,
    VoidCallback? onConfirm}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
    builder: (BuildContext context) {
      return SizedBox(
        height: 30.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
              ),
            ),
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.red),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: onConfirm,
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    },
  );
}

void showBlockUserBottomSheet(
    {required BuildContext context,
    required String username,
    VoidCallback? onConfirm}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
    builder: (BuildContext context) {
      return SizedBox(
        height: 30.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
              child: Column(
                children: [
                  Text(
                    "Are you sure want to Block",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Wrap(
                    children: [
                      Text(
                        username,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        " ?",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            ElevatedButton(
              onPressed: onConfirm,
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    },
  );
}

void showShareBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
    builder: (BuildContext context) {
      return SizedBox(
        height: 30.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                "Share to",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Wrap(
              spacing: 2.w,
              children: [
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/facebook.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/twitter.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/instagram.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/telegram.png",
                    scale: 1.0,
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 2.w,
              children: [
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/linkedin.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/whatsapp.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/tiktok.png",
                    scale: 1.0,
                  ),
                ),
                IconButton(
                  splashRadius: 25.0,
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/share-icons/youtube.png",
                    scale: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showContentTipDialog(
    {required BuildContext context,
    required TextEditingController controller,
    required String prefixCurrency,
    VoidCallback? onConfirm}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.symmetric(horizontal: 5.w),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Send tip?"),
            IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.zero,
              splashRadius: 0.1,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        content: GradientTextField(
          controller: controller,
          keyboardType: TextInputType.number,
          prefixText: prefixCurrency,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.only(bottom: 1.h),
        actions: [
          ElevatedButton(
            onPressed: onConfirm,
            child: const Text("Confirm"),
          ),
        ],
      );
    },
  );
}

void showContentOptionDialog(
    {required BuildContext context,
    VoidCallback? onShowPost,
    VoidCallback? onReportPost}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        content: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onShowPost,
                child: const Text("Show post"),
              ),
              Divider(
                height: 4.h,
              ),
              GestureDetector(
                onTap: onReportPost,
                child: const Text("Report this post"),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showShareDialog(
    {required BuildContext context,
    VoidCallback? onShowPost,
    VoidCallback? onReportPost}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
        contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/facebook.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/twitter.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/instagram.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/telegram.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/linkedin.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/whatsapp.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/tiktok.png",
                  scale: 1.0,
                ),
              ),
              IconButton(
                splashRadius: 25.0,
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/share-icons/youtube.png",
                  scale: 1.0,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
