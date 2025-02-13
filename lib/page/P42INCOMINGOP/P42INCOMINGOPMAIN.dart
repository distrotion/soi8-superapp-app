import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/42-01-P42INCOMINGOPMAIN.dart';
import '../../bloc/BlocEvent/42-02-P42INCOMINGOPMAINinside.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/table/P42INCOMINGOPTABLE.dart';
import 'P42INCOMINGOPVAR.dart';

class P42INCOMINGOPMAIN extends StatefulWidget {
  P42INCOMINGOPMAIN({
    super.key,
    this.data,
  });
  List<P42INCOMINGOPMAINclass>? data;

  @override
  State<P42INCOMINGOPMAIN> createState() => _P42INCOMINGOPMAINState();
}

class _P42INCOMINGOPMAINState extends State<P42INCOMINGOPMAIN> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P42INCOMINGOPMAIN__Bloc>().add(P42INCOMINGOPMAIN_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P42INCOMINGOPMAINclass> _data = widget.data ?? [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 46, right: 40, left: 40),
        child: Column(
          children: [
            P42INCOMINGOPTABLE(),
            for (int i = 0; i < _data.length; i++) ...[
              P42INCOMINGOPTABLEitem(
                text01: _data[i].MAT,
                text02: _data[i].VDNAME,
                text03: _data[i].LOT,
                text04: _data[i].QTY,
                text05: _data[i].UNIT,
                text06: _data[i].PACKET,
                text07: _data[i].UNITSIZE,
                text08: _data[i].QTYPUNIT,
                setupreturn: (v) {
                  P42INCOMINGOPVAR.coutin = 0;
                  P42INCOMINGOPVAR.MAT = _data[i].MAT;
                  P42INCOMINGOPVAR.VDNAME = _data[i].VDNAME;
                  P42INCOMINGOPVAR.LOT = _data[i].LOT;
                  P42INCOMINGOPVAR.QTY = _data[i].QTY;
                  P42INCOMINGOPVAR.UNIT = _data[i].UNIT;
                  P42INCOMINGOPVAR.PACKET = _data[i].PACKET;
                  P42INCOMINGOPVAR.UNITSIZE = _data[i].UNITSIZE;
                  P42INCOMINGOPVAR.QTYPUNIT = _data[i].QTYPUNIT;
                  _TEMPpop(context);
                },
                HOLDvers: _data[i].HOLD,
                HOLDver: (v) {
                  setState(() {
                    _data[i].HOLD = v;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void _TEMPpop(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: _getdataset(),
      );
    },
  );
}

class _getdataset extends StatelessWidget {
  const _getdataset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P42INCOMINGOPMAINinside__Bloc(),
        child: BlocBuilder<P42INCOMINGOPMAINinside__Bloc,
            List<P42INCOMINGOPMAINinsideclass>>(
          builder: (context, data) {
            return _TempSelectWALLet(
              data: data,
            );
          },
        ));
  }
}

class _TempSelectWALLet extends StatefulWidget {
  _TempSelectWALLet({
    super.key,
    this.data,
  });
  List<P42INCOMINGOPMAINinsideclass>? data;
  @override
  State<_TempSelectWALLet> createState() => _TempSelectWALLetState();
}

class _TempSelectWALLetState extends State<_TempSelectWALLet> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<P42INCOMINGOPMAINinside__Bloc>()
        .add(P42INCOMINGOPMAINinside_GET());
  }

  @override
  Widget build(BuildContext context) {
    List<P42INCOMINGOPMAINinsideclass> _data = widget.data ?? [];
    List<P42INCOMINGOPMAINinsideclass> _dataout = [
      P42INCOMINGOPMAINinsideclass(
          INCCHECKLIST: [P42INCOMINGOPMAINinsidesubclass(TYPE: '')])
    ];
    if (_data.length > 0) {
      _dataout = _data;
    }

    return SizedBox(
        height: 400,
        width: 680,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 26,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("MAT :"),
                          ),
                          Text(P42INCOMINGOPVAR.MAT),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("VDNAME :"),
                          ),
                          Text(P42INCOMINGOPVAR.VDNAME),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("LOT :"),
                          ),
                          Text(P42INCOMINGOPVAR.LOT),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("QTY :"),
                          ),
                          Text(P42INCOMINGOPVAR.QTY),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("UNIT :"),
                          ),
                          Text(P42INCOMINGOPVAR.UNIT),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("PACKET :"),
                          ),
                          Text(P42INCOMINGOPVAR.PACKET),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("UNITSIZE :"),
                          ),
                          Text(P42INCOMINGOPVAR.UNITSIZE),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("QTYPUNIT :"),
                          ),
                          Text(P42INCOMINGOPVAR.QTYPUNIT),
                        ],
                      ),
                      SizedBox(
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                color: Colors.blue,
                                child: Center(
                                  child: Text(
                                      "${_dataout[0].INCCHECKLIST[P42INCOMINGOPVAR.coutin].ITEMS}"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: const Color.fromARGB(255, 243, 173, 33),
                                child: Center(
                                  child: Text(
                                      "${P42INCOMINGOPVAR.coutin + 1}/${_dataout[0].INCCHECKLIST.length}"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  //
                                  setState(() {
                                    if (P42INCOMINGOPVAR.coutin + 1 <
                                        _dataout[0].INCCHECKLIST.length) {
                                      P42INCOMINGOPVAR.coutin++;
                                    }
                                  });
                                },
                                child: Container(
                                  color: const Color.fromARGB(255, 75, 33, 243),
                                  child: const Center(
                                    child: Text(
                                      "NEXT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_dataout[0]
                              .INCCHECKLIST[P42INCOMINGOPVAR.coutin]
                              .TYPE ==
                          'A') ...[
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: Colors.green,
                            child: Center(
                              child: Text("GOOD"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            child: Center(
                              child: Text("NO GOOD"),
                            ),
                          ),
                        ),
                      ] else if (_dataout[0]
                              .INCCHECKLIST[P42INCOMINGOPVAR.coutin]
                              .TYPE ==
                          'V') ...[
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                _dataout[0]
                                            .INCCHECKLIST[
                                                P42INCOMINGOPVAR.coutin]
                                            .EQ ==
                                        '='
                                    ? "SPECK [ ${_dataout[0].INCCHECKLIST[P42INCOMINGOPVAR.coutin].MAX} - ${_dataout[0].INCCHECKLIST[P42INCOMINGOPVAR.coutin].MIN} ]"
                                    : _dataout[0]
                                                .INCCHECKLIST[
                                                    P42INCOMINGOPVAR.coutin]
                                                .EQ ==
                                            '>'
                                        ? "SPECK [ > ${_dataout[0].INCCHECKLIST[P42INCOMINGOPVAR.coutin].MIN} ]"
                                        : "SPECK [ < ${_dataout[0].INCCHECKLIST[P42INCOMINGOPVAR.coutin].MAX} ]",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.green,
                            child: Center(
                              child: ComInputText(
                                isNumberOnly: true,
                                height: 40,
                                width: 250,
                                isContr: P42INCOMINGOPVAR.iscontrol,
                                fnContr: (input) {
                                  P42INCOMINGOPVAR.iscontrol = input;
                                },
                                sValue: P42INCOMINGOPVAR.ANS,
                                returnfunc: (String s) {
                                  P42INCOMINGOPVAR.ANS = s;
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.green,
                            child: Center(
                              child: Text("CONFIRM"),
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: Colors.red,
                            child: Center(
                              child: Text("NO DATA"),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
