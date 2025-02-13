import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/21-1-01-REGISTERHIS.dart';
import '../../bloc/BlocEvent/32-1-01-P32SENDTOSAPHIS.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/REGISTERAPtable.dart';
import '../../widget/table/SENDTOSAPHIStable.dart';
import '../../widget/table/mastertablewidget.dart';
import '../../widget/table/newitemtablewidget.dart';
import 'P32SENDTOSAPHISvar.dart';

class P32SENDTOSAPHISmain extends StatefulWidget {
  const P32SENDTOSAPHISmain({super.key});

  @override
  State<P32SENDTOSAPHISmain> createState() => _P32SENDTOSAPHISmainState();
}

class _P32SENDTOSAPHISmainState extends State<P32SENDTOSAPHISmain> {
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
        create: (_) => SENDTOSAPHIS_Bloc(),
        child: BlocBuilder<SENDTOSAPHIS_Bloc, List<SENDTOSAPHISitem>>(
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
  List<SENDTOSAPHISitem>? data;
  @override
  State<NEW_ITEM> createState() => _NEW_ITEMState();
}

class _NEW_ITEMState extends State<NEW_ITEM> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //REGISTERHIS_GET
    context.read<SENDTOSAPHIS_Bloc>().add(SENDTOSAPHIS_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<SENDTOSAPHISitem> _data = widget.data ?? [];
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
              //               P32SENDTOSAPHISvar.startDATE = v;
              //               P32SENDTOSAPHISvar.startDATElist = v.split('-');

              //               if (P32SENDTOSAPHISvar.startDATElist.isNotEmpty) {
              //                 P32SENDTOSAPHISvar.startDATEout.year =
              //                     P32SENDTOSAPHISvar.startDATElist[0];
              //                 P32SENDTOSAPHISvar.startDATEout.month =
              //                     P32SENDTOSAPHISvar.startDATElist[1];
              //                 P32SENDTOSAPHISvar.startDATEout.day =
              //                     P32SENDTOSAPHISvar.startDATElist[2];
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
              //               child: Text(P32SENDTOSAPHISvar.startDATE),
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
              //               P32SENDTOSAPHISvar.endDATE = v;
              //               P32SENDTOSAPHISvar.endDATElist = v.split('-');

              //               if (P32SENDTOSAPHISvar.endDATElist.isNotEmpty) {
              //                 P32SENDTOSAPHISvar.endDATEout.year =
              //                     P32SENDTOSAPHISvar.endDATElist[0];
              //                 P32SENDTOSAPHISvar.endDATEout.month =
              //                     P32SENDTOSAPHISvar.endDATElist[1];
              //                 P32SENDTOSAPHISvar.endDATEout.day =
              //                     P32SENDTOSAPHISvar.endDATElist[2];
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
              //               child: Text(P32SENDTOSAPHISvar.endDATE),
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ComInputText(
              //     sPlaceholder: "search",
              //     height: 40,
              //     width: 400,
              //     isContr: P32SENDTOSAPHISvar.iscontrol,
              //     fnContr: (input) {
              //       P32SENDTOSAPHISvar.iscontrol = input;
              //     },
              //     sValue: P32SENDTOSAPHISvar.SEARCH,
              //     returnfunc: (String s) {
              //       P32SENDTOSAPHISvar.SEARCH = s;
              //     },
              //   ),
              // ),
              SizedBox(
                height: 580,
                width: 780,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SENDTOSAPHIStable(),
                      //----------

                      for (int i = 0; i < _data.length; i++) ...[
                        _data[i],
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
