import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/102-02-01-Zone01NEWITEMTABLE.dart';
import '../../bloc/BlocEvent/21-1-01-REGISTERHIS.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P21REGISTERAPHISvar.dart';

class P21REGISTERAPHISmain extends StatefulWidget {
  const P21REGISTERAPHISmain({super.key});

  @override
  State<P21REGISTERAPHISmain> createState() => _P21REGISTERAPHISmainState();
}

class _P21REGISTERAPHISmainState extends State<P21REGISTERAPHISmain> {
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
        create: (_) => REGISTERHIS_Bloc(),
        child: BlocBuilder<REGISTERHIS_Bloc, List<REGISTERAPitem>>(
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
  List<REGISTERAPitem>? data;
  @override
  State<NEW_ITEM> createState() => _NEW_ITEMState();
}

class _NEW_ITEMState extends State<NEW_ITEM> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //REGISTERHIS_GET
    context.read<REGISTERHIS_Bloc>().add(REGISTERHIS_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<REGISTERAPitem> _data = widget.data ?? [];
    List<REGISTERAPitem> _datas = _data;
    if (P21REGISTERAPHISvar.SEARCH != '') {
      _datas = [];
      for (var i = 0; i < _data.length; i++) {
        if (_data[i]
                .text01!
                .toUpperCase()
                .contains(P21REGISTERAPHISvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text02!
                .toUpperCase()
                .contains(P21REGISTERAPHISvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text03!
                .toUpperCase()
                .contains(P21REGISTERAPHISvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text04!
                .toUpperCase()
                .contains(P21REGISTERAPHISvar.SEARCH.toUpperCase()) ||
            _data[i]
                .text05!
                .toUpperCase()
                .contains(P21REGISTERAPHISvar.SEARCH.toUpperCase())) {
          _datas.add(_data[i]);
        }
      }
    }
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 720,
          // width: 1280,
          child: Column(
            children: [
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Column(
              //       children: [
              //         Text("start"),
              //         InkWell(
              //           onTap: () {
              //             CalendaSelectDate(context, DateTime.now(), (v) {
              //               P21REGISTERAPHISvar.startDATE = v;
              //               P21REGISTERAPHISvar.startDATElist = v.split('-');

              //               if (P21REGISTERAPHISvar.startDATElist.isNotEmpty) {
              //                 P21REGISTERAPHISvar.startDATEout.year =
              //                     P21REGISTERAPHISvar.startDATElist[0];
              //                 P21REGISTERAPHISvar.startDATEout.month =
              //                     P21REGISTERAPHISvar.startDATElist[1];
              //                 P21REGISTERAPHISvar.startDATEout.day =
              //                     P21REGISTERAPHISvar.startDATElist[2];
              //               }
              //               setState(() {});
              //             });
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               // color: Color(0x00b23127),
              //               // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

              //               // image: DecorationImage(
              //               //   image: AssetImage("assets/icons/groupNEW@3x.png"),
              //               //   fit: BoxFit.fitWidth,
              //               // ),
              //               border: Border.all(color: Colors.black),
              //               borderRadius: const BorderRadius.only(
              //                 topLeft: Radius.circular(8.0),
              //                 topRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0),
              //                 bottomRight: Radius.circular(8.0),
              //               ),
              //             ),
              //             height: 40,
              //             width: 200,
              //             child: Center(
              //               child: Text(P21REGISTERAPHISvar.startDATE),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Text("end"),
              //         InkWell(
              //           onTap: () {
              //             CalendaSelectDate(context, DateTime.now(), (v) {
              //               P21REGISTERAPHISvar.endDATE = v;
              //               P21REGISTERAPHISvar.endDATElist = v.split('-');

              //               if (P21REGISTERAPHISvar.endDATElist.isNotEmpty) {
              //                 P21REGISTERAPHISvar.endDATEout.year =
              //                     P21REGISTERAPHISvar.endDATElist[0];
              //                 P21REGISTERAPHISvar.endDATEout.month =
              //                     P21REGISTERAPHISvar.endDATElist[1];
              //                 P21REGISTERAPHISvar.endDATEout.day =
              //                     P21REGISTERAPHISvar.endDATElist[2];
              //               }
              //               setState(() {});
              //             });
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               // color: Color(0x00b23127),
              //               // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

              //               // image: DecorationImage(
              //               //   image: AssetImage("assets/icons/groupNEW@3x.png"),
              //               //   fit: BoxFit.fitWidth,
              //               // ),
              //               border: Border.all(color: Colors.black),
              //               borderRadius: const BorderRadius.only(
              //                 topLeft: Radius.circular(8.0),
              //                 topRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0),
              //                 bottomRight: Radius.circular(8.0),
              //               ),
              //             ),
              //             height: 40,
              //             width: 200,
              //             child: Center(
              //               child: Text(P21REGISTERAPHISvar.endDATE),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         SizedBox(
              //           height: 16,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 16),
              //           child: Container(
              //             width: 200,
              //             height: 40,
              //             color: Colors.blue,
              //             child: Center(
              //               child: Text("SELECT"),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ComInputText(
                  sPlaceholder: "search",
                  height: 40,
                  width: 400,
                  isContr: P21REGISTERAPHISvar.iscontrol,
                  fnContr: (input) {
                    P21REGISTERAPHISvar.iscontrol = input;
                  },
                  sValue: P21REGISTERAPHISvar.SEARCH,
                  returnfunc: (String s) {
                    setState(() {
                      P21REGISTERAPHISvar.SEARCH = s;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 580,
                width: 780,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      REGISTERAPtable(),
                      //----------

                      for (int i = 0; i < _datas.length; i++) ...[
                        _datas[i],
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
