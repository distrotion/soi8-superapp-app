import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-02-01-Zone00NEWITEMTABLE.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P102-05-layout.dart';
import 'Zone00VAR.dart';

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
        create: (_) => ZONE00NEWITEMTABLE_Bloc(),
        child:
            BlocBuilder<ZONE00NEWITEMTABLE_Bloc, List<TABLECOLUNMNNEWTABLET>>(
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
    context.read<ZONE00NEWITEMTABLE_Bloc>().add(ZONE00NEWITEMTABLE_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<TABLECOLUNMNNEWTABLET> _data = widget.data ?? [];
    return Column(
      children: [
        Container(
          width: 720,
          child: Row(
            children: [
              ComInputText(
                sPlaceholder: "BARCODE",
                height: 40,
                width: 200,
                isContr: ZONE00NEWITEMVAR.iscontrol,
                fnContr: (input) {
                  ZONE00NEWITEMVAR.iscontrol = input;
                },
                sValue: ZONE00NEWITEMVAR.BARCODENEWITEM,
                returnfunc: (String s) {
                  ZONE00NEWITEMVAR.BARCODENEWITEM = s;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 150,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      "NEW ITEM",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 720,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: ComInputText(
                  sPlaceholder: "search",
                  height: 40,
                  width: 400,
                  isContr: ZONE00NEWITEMVAR.iscontrol,
                  fnContr: (input) {
                    ZONE00NEWITEMVAR.iscontrol = input;
                  },
                  sValue: ZONE00NEWITEMVAR.SEARCH,
                  returnfunc: (String s) {
                    ZONE00NEWITEMVAR.SEARCH = s;
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 40),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Container(
              //       height: 50,
              //       width: 150,
              //       color: Colors.black,
              //       child: Center(
              //           child: Text(
              //         "NEW ",
              //         style: TextStyle(color: Colors.white),
              //       )),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 580,
            width: 780,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // laooutRM2(),
                  const SizedBox(
                    height: 20,
                  ),
                  NEWTABLETABLE(),

                  //----------

                  for (int i = 0; i < _data.length; i++) ...[
                    _data[i],
                  ]
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
