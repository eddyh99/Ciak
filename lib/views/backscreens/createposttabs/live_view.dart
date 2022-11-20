import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_dropdown_widget.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveView extends StatefulWidget {
  const LiveView({super.key});

  @override
  State<LiveView> createState() {
    return _LiveViewState();
  }
}

class _LiveViewState extends State<LiveView> {
  final List<String> _startingTime = ["Now", "Schedule"];
  final List<String> _selectionTime = ["Now"];
  final List<String> _liveType = ["Free"];
  String _selectedTime = "Now";
  String _selectedSelection = "Now";
  String _selectedType = "Free";

  final TextEditingController _liveTextController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  final TextEditingController _timeTextController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 11.h,
                            width: 30.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Starting time",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                GradientDropdownButton(
                                  items: _startingTime,
                                  currentValue: _selectedTime,
                                  onSelected: (value) {
                                    setState(() {
                                      _selectedTime = value.toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          _selectedTime == "Schedule"
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 11.h,
                                  width: 30.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Selection",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      GradientDropdownButton(
                                        items: _selectionTime,
                                        currentValue: _selectedSelection,
                                        onSelected: (value) {
                                          setState(() {
                                            _selectedSelection =
                                                value.toString();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                      _selectedTime == "Schedule"
                          ? Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 11.h,
                                    width: 30.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        GradientTextField(
                                          controller: _dateTextController,
                                          keyboardType: TextInputType.datetime,
                                          hintText: "../../....",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    height: 11.h,
                                    width: 30.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Time",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        GradientTextField(
                                          controller: _timeTextController,
                                          keyboardType: TextInputType.datetime,
                                          hintText: ".. : ..",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: SizedBox(
                    width: 90.w,
                    child: GradientTextField(
                      focusNode: _focusNode,
                      controller: _liveTextController,
                      maxLines: 5,
                      maxLength: 150,
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
                        height: 6.h,
                        width: 30.w,
                        child: GradientDropdownButton(
                          items: _liveType,
                          currentValue: _selectedType,
                          onSelected: (value) {
                            setState(() {
                              _selectedType = value.toString();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed("/back-screen/live-cam",
                                arguments: {"type": "live"});
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
