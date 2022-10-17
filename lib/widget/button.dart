import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String textbutton;
  final VoidCallback? onClick;
  final double opacity;
  const ButtonWidget(
      {Key? key, required this.textbutton, this.onClick, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 2) - 100,
                    right: (MediaQuery.of(context).size.width / 2) - 100),
                child: SizedBox(
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Color.fromRGBO(248, 59, 0, opacity)),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.center,
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 12),
                                ),
                                onPressed: () {
                                  return onClick!();
                                },
                                child: Text(
                                  textbutton,
                                  style: opacity == 1
                                      ? const TextStyle(color: Colors.white)
                                      : const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))))
      ],
    );
  }
}
