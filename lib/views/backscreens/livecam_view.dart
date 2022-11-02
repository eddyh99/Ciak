import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/livecamera_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveCamView extends StatefulWidget {
  const LiveCamView({super.key});

  @override
  State<LiveCamView> createState() {
    return _LiveCamViewState();
  }
}

class _LiveCamViewState extends State<LiveCamView> {
  final Map<String, String> _camType = Get.arguments;
  bool _camIsOn = true;
  bool _micIsOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          _camType["type"]!.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  _micIsOn == true ? _micIsOn = false : _micIsOn = true;
                });
              }
            },
            icon: Icon(
              _micIsOn ? Icons.mic_off_outlined : Icons.mic_outlined,
              color: Colors.grey,
            ),
            splashRadius: 15.sp,
          ),
          IconButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  _camIsOn == true ? _camIsOn = false : _camIsOn = true;
                });
              }
            },
            icon: Icon(
              _camIsOn
                  ? Icons.videocam_off_outlined
                  : Icons.video_camera_front_outlined,
              color: Colors.grey,
            ),
            splashRadius: 15.sp,
          ),
        ],
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  child: LiveCamera(
                    hideCamera: _camIsOn ? false : true,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
                  child: Wrap(
                    spacing: 2.w,
                    children: [
                      SizedBox(
                        height: 6.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Enter"),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed("/back-screen/");
                          },
                          child: const Text("Leave"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
