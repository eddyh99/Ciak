import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class FooterMenu extends StatelessWidget {
  const FooterMenu({
    super.key,
    required this.controller,
    required this.currentIndex,
    this.onMainButtonPressed,
  });

  final PageController controller;
  final int currentIndex;
  final VoidCallback? onMainButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              controller.animateToPage(
                value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            iconSize: 21.sp,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Feeds"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: const Icon(Icons.list_rounded),
                  ),
                  label: "Activity"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: const Icon(Icons.account_balance_wallet_outlined),
                  ),
                  label: "Wallet"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "Profile"),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: onMainButtonPressed,
            child: Center(
              heightFactor: 1.4,
              widthFactor: 1.4,
              child: Icon(
                Icons.add_rounded,
                size: 21.sp,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
