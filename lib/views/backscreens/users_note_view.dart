import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersNoteView extends StatefulWidget {
  const UsersNoteView({super.key});

  @override
  State<UsersNoteView> createState() {
    return _UsersNoteViewState();
  }
}

class _UsersNoteViewState extends State<UsersNoteView> {
  final TextEditingController _noteTextController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: const EdgeInsets.all(10.0),
          splashRadius: 25.0,
          onPressed: () {
            Get.back(closeOverlays: true);
          },
          icon: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: 12.sp,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SizedBox(
            width: 90.w,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("CREATE NOTE FOR THIS USER"),
                  SizedBox(
                    height: 1.h,
                  ),
                  GradientTextField(
                    focusNode: _focusNode,
                    controller: _noteTextController,
                    maxLines: 10,
                    hintText: "Write here...",
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 6.h,
                    width: 30.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Send"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
