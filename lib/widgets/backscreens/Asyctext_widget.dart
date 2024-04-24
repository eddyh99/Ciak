import 'package:flutter/material.dart';

import 'package:ciak_app/utils/extensions.dart';
import 'package:ciak_app/widgets/backscreens/shimmer_widget.dart';

class AsyctextWidget extends StatelessWidget {
  final Future<dynamic> datas;
  const AsyctextWidget({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datas,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as dynamic;
          return Text(
            data,
            style: const TextStyle(
              color: Color.fromRGBO(114, 162, 138, 1),
            ),
          );
        } else {
          return ShimmerWidget(tinggi: 1.h, lebar: 5.w);
        }
      },
    );
  }
}
