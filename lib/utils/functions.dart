import 'dart:math';

import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

void printDebug(Object object) {
  if (kDebugMode) {
    print(object);
  }
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

void showContentBottomSheet(
    {required BuildContext context,
    required String price,
    required String text,
    VoidCallback? onConfirm}) {
  showModalBottomSheet<void>(
    context: context,
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
