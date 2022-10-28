import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/walletcard_widget.dart';
import 'package:flutter/material.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() {
    return _WalletViewState();
  }
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? const AssetImage("assets/images/wallet-view-bg.png")
                    : const AssetImage("assets/images/wallet-view-bg-dark.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: const WalletCard(balance: "\$ 8,351.00"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        child: Text.rich(
                          const TextSpan(
                            text:
                                "To Top up & Withdraw, please access to your Trackless wallet.",
                          ),
                          style: TextStyle(height: 0.25.h),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        child: GradientButton(
                          width: 50.w,
                          onPressed: () {},
                          text: "Trackless Log in",
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
