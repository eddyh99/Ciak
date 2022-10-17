import 'package:flutter/material.dart';

class PostCiakPage extends StatefulWidget {
  const PostCiakPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PostCiakPage> createState() => _PostCiakPageState();
}

class _PostCiakPageState extends State<PostCiakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Expanded(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 8, //or null
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter your text here"),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Color.fromARGB(255, 17, 17, 17),
                  ),
                ],
              )),
        )),
      ),
    );
  }
}
