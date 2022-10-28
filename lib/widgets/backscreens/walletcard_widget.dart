import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.balance});
  final String balance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Card(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.grey[700],
          child: Container(
            constraints: BoxConstraints(minHeight: 25.h),
            child: ListTile(
              title: Text("Balance",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.white)),
              subtitle: Text(
                balance,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          right: -7.w,
          top: -4.h,
          child: SizedBox(
            width: 20.h,
            child: Image.asset(
              "assets/images/wallet-logo.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
