import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-01-01-Zone01MASTERTABLE.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import 'Zone01VAR.dart';

class MASTER_TABLE_P extends StatefulWidget {
  const MASTER_TABLE_P({super.key});

  @override
  State<MASTER_TABLE_P> createState() => _MASTER_TABLE_PState();
}

class _MASTER_TABLE_PState extends State<MASTER_TABLE_P> {
  @override
  Widget build(BuildContext context) {
    return _MASTER_TABLE_BLOC();
  }
}

class _MASTER_TABLE_BLOC extends StatelessWidget {
  /// {@macro counter_page}
  const _MASTER_TABLE_BLOC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Zone01MASTERTABLE_Bloc(),
        child: BlocBuilder<Zone01MASTERTABLE_Bloc, List<TABLECOLUNMNMASTER>>(
          builder: (context, data) {
            return MASTER_TABLE(data: data);
          },
        ));
  }
}

class MASTER_TABLE extends StatefulWidget {
  MASTER_TABLE({
    super.key,
    this.data,
  });
  List<TABLECOLUNMNMASTER>? data;

  @override
  State<MASTER_TABLE> createState() => _MASTER_TABLEState();
}

class _MASTER_TABLEState extends State<MASTER_TABLE> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Zone01MASTERTABLE_Bloc>().add(Zone01MASTERTABLE_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<TABLECOLUNMNMASTER> _data = widget.data ?? [];
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComInputText(
                sPlaceholder: "search",
                height: 40,
                width: 400,
                isContr: Zone01MASTERVAR.iscontrol,
                fnContr: (input) {
                  Zone01MASTERVAR.iscontrol = input;
                },
                sValue: Zone01MASTERVAR.SEARCH,
                returnfunc: (String s) {
                  Zone01MASTERVAR.SEARCH = s;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.black,
                  child: Center(
                      child: Text(
                    "NEW MASTER",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 580,
          width: 780,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MASTERTABLE(),
                //----------
                for (int i = 0; i < _data.length; i++) ...[
                  _data[i],
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
