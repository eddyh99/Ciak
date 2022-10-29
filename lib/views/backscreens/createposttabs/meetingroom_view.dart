import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_dropdown_widget.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:flutter/material.dart';

class MeetingRoomView extends StatefulWidget {
  const MeetingRoomView({super.key});

  @override
  State<MeetingRoomView> createState() {
    return _MeetingRoomViewState();
  }
}

class _MeetingRoomViewState extends State<MeetingRoomView> {
  final TextEditingController _meetingTextController = TextEditingController();

  final List<String> _meetingType = ["Public", "Private"];
  String _selectedType = "Public";

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: SizedBox(
                    width: 90.w,
                    child: GradientTextField(
                      focusNode: _focusNode,
                      controller: _meetingTextController,
                      maxLines: 10,
                      hintText: "Description...",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: SizedBox(
                    height: 6.h,
                    width: 30.w,
                    child: GradientDropdownButton(
                      items: _meetingType,
                      currentValue: _selectedType,
                      onSelected: (value) {
                        setState(() {
                          _selectedType = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 6.h,
                        width: 40.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Invite Guests"),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                        width: 40.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Start Alone"),
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
