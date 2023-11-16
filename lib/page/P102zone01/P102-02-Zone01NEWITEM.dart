import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-02-01-Zone01NEWITEMTABLE.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'Zone01VAR.dart';

class NEW_ITEM_P extends StatefulWidget {
  const NEW_ITEM_P({super.key});

  @override
  State<NEW_ITEM_P> createState() => _NEW_ITEM_PState();
}

class _NEW_ITEM_PState extends State<NEW_ITEM_P> {
  @override
  Widget build(BuildContext context) {
    return _NEW_ITEM_BLOC();
  }
}

class _NEW_ITEM_BLOC extends StatelessWidget {
  /// {@macro counter_page}
  const _NEW_ITEM_BLOC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Zone01NEWITEMTABLE_Bloc(),
        child:
            BlocBuilder<Zone01NEWITEMTABLE_Bloc, List<TABLECOLUNMNNEWTABLET>>(
          builder: (context, data) {
            return NEW_ITEM(data: data);
          },
        ));
  }
}

class NEW_ITEM extends StatefulWidget {
  NEW_ITEM({
    super.key,
    this.data,
  });
  List<TABLECOLUNMNNEWTABLET>? data;
  @override
  State<NEW_ITEM> createState() => _NEW_ITEMState();
}

class _NEW_ITEMState extends State<NEW_ITEM> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Zone01NEWITEMTABLE_Bloc>().add(Zone01NEWITEMTABLE_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<TABLECOLUNMNNEWTABLET> _data = widget.data ?? [];
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
                isContr: Zone01NEWITEMVAR.iscontrol,
                fnContr: (input) {
                  Zone01NEWITEMVAR.iscontrol = input;
                },
                sValue: Zone01NEWITEMVAR.SEARCH,
                returnfunc: (String s) {
                  Zone01NEWITEMVAR.SEARCH = s;
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
                NEWTABLETABLE(),
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
