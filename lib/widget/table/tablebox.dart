import 'package:flutter/material.dart';

class rowbox_type0 extends StatelessWidget {
  rowbox_type0({
    Key? key,
    this.Head,
    this.Colorss,
  }) : super(key: key);
  String? Head;
  Color? Colorss;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox(
                textin: Head ?? '',
                Colorss: Colorss,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox extends StatelessWidget {
  oneunitbox({
    Key? key,
    this.textin,
    this.textsize,
    this.Colorss,
  }) : super(key: key);
  String? textin;
  double? textsize;
  Color? Colorss;
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
        color: Colorss ?? Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
    );
  }
}

class rowbox_type1 extends StatelessWidget {
  rowbox_type1({
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
              child: oneunitbox01(),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox01 extends StatelessWidget {
  oneunitbox01({Key? key, this.textin, this.textsize}) : super(key: key);
  String? textin;
  double? textsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: SizedBox(
          child: Center(
            child: Icon(
              Icons.edit,
            ),
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
