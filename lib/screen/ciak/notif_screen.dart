import 'package:flutter/material.dart';

class NotifCiakPage extends StatefulWidget {
  const NotifCiakPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NotifCiakPage> createState() => _NotifCiakPageState();
}

class _NotifCiakPageState extends State<NotifCiakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text('Alerts',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.normal)),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Mark all as read',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.centerLeft,
                    child: Text('TODAY',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                                child: Column(
                              children: [
                                ListTile(
                                  leading:
                                      CircleAvatar(child: Icon(Icons.favorite)),
                                  title: RichText(
                                      text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'A person and +2 other ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'liked your post.')
                                    ],
                                  )),
                                  subtitle: Text('10m ago'),
                                ),
                                Divider(
                                  color: Colors.black,
                                )
                              ],
                            ));
                          }))
                ],
              )),
        ),
      ),
    );
  }
}
