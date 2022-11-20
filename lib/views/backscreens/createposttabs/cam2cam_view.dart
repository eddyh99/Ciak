import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CamToCamView extends StatefulWidget {
  const CamToCamView({super.key});

  @override
  State<CamToCamView> createState() {
    return _CamToCamViewState();
  }
}

class _CamToCamViewState extends State<CamToCamView> {
  final TextEditingController _camTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _priceTextController.text = "0.00";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 100.w,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: SizedBox(
                    width: 90.w,
                    child: GradientTextField(
                      focusNode: _focusNode,
                      controller: _camTextController,
                      maxLines: 10,
                      hintText: "Description...",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 11.h,
                        width: 30.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price per minute",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GradientTextField(
                              controller: _priceTextController,
                              keyboardType: TextInputType.number,
                              suffixText: "USD",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        height: 6.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/back-screen/recipient",
                                arguments: {"type": "cam"});
                          },
                          child: const Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
