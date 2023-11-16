import 'package:flutter/material.dart';

class rowbox_type0 extends StatelessWidget {
  rowbox_type0({
    Key? key,
    this.Head,
  }) : super(key: key);
  String? Head;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox(
                textin: Head ?? '',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox extends StatelessWidget {
  oneunitbox({Key? key, this.textin, this.textsize}) : super(key: key);
  String? textin;
  double? textsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          textin ?? '',
          style: TextStyle(
            fontSize: textsize ?? 12,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
    );
  }
}
