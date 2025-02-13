import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/43-01-P43SETRAWMAT.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/P42INCOMINGOPTABLE.dart';
import '../../widget/table/P43SETRAWMAT.dart';
import 'P43SETRAWMATVAR.dart';

class P43SETRAWMATMAIN extends StatefulWidget {
  P43SETRAWMATMAIN({
    super.key,
    this.data,
  });
  List<P43SETRAWMATMAINclass>? data;

  @override
  State<P43SETRAWMATMAIN> createState() => _P43SETRAWMATMAINState();
}

class _P43SETRAWMATMAINState extends State<P43SETRAWMATMAIN> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P43SETRAWMATMAIN__Bloc>().add(P43SETRAWMATMAIN_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P43SETRAWMATMAINclass> _data = widget.data ?? [];

    return Container(
      height: 400,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 46, right: 40, left: 40),
          child: Column(
            children: [
              Text("Raw mat Prepareation"),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("ORDER : "),
                  Text(P43SETRAWMATVAR.MAT),
                  Text(P43SETRAWMATVAR.ORDER),
                  SizedBox(
                    width: 16,
                  ),
                  Text(P43SETRAWMATVAR.NAME),
                ],
              ),
              P43SETRAWMATTABLE(),
              for (int i = 0; i < _data.length; i++) ...[
                P43SETRAWMATTABLEitem(
                  text01: '${i + 1}',
                  text02: _data[i].Bc,
                  text03: _data[i].Chm,
                  text04: _data[i].W,
                  text05: "",
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
