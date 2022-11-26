import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/videowrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostFeedContent extends StatelessWidget {
  const PostFeedContent(
      {super.key, required this.content, this.contentPadding});

  final Widget content;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: content,
      ),
    );
  }
}

class PostContent {
  // ignore: unused_field
  static final PostContent _instance = PostContent();

  PostContent();

  static Widget text(String text, {TextStyle? style}) {
    return Html(data: text);
    /*
    return Text.rich(
      style: style ?? TextStyle(height: 0.2.h),
      textAlign: TextAlign.justify,
      TextSpan(
        text: text,
      ),
    );
    */
  }

  static Widget image(Image image, {required double aspectRatio}) {
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image(
          image: image.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget imageMulti(List<Image> images,
      {required double aspectRatio,
      required double maxImageHeight,
      EdgeInsets? padding}) {
    return SizedBox(
      height: maxImageHeight,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 2.w,
          );
        },
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return image(images[index], aspectRatio: aspectRatio);
        },
      ),
    );
  }

  static Widget video(String videoPath,
      {double? aspectRatio, bool useController = false}) {
    return Container(
      constraints: BoxConstraints(maxHeight: 40.h),
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: VideoWrapper(
          videoPath: videoPath,
          aspectRatio: aspectRatio,
          useController: useController,
        ),
      ),
    );
  }
}
