import 'package:flutter/material.dart';
import 'package:ciak_app/utils/extensions.dart';

class LoaderAlert extends StatelessWidget {
  const LoaderAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      content: SizedBox(
          height: 9.h,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(79, 243, 1, 1),
                ),
              ),
            ],
          )),
    );
  }
}
