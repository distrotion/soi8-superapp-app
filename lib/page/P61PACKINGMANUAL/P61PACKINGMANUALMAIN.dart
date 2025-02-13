import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../data/base64pic.dart';
import '../../widget/common/ComInputText.dart';
import 'P61PACKINGMANUALVAR.dart';

class P61PACKINGMANUALMAIN extends StatefulWidget {
  const P61PACKINGMANUALMAIN({super.key});

  @override
  State<P61PACKINGMANUALMAIN> createState() => _P61PACKINGMANUALMAINState();
}

class _P61PACKINGMANUALMAINState extends State<P61PACKINGMANUALMAIN> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600,
        width: 900,
        // color: Colors.red,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    width: 200,
                    child: ComInputText(
                      isNumberOnly: true,
                      sLabel: "ORDER",
                      height: 40,
                      width: 200,
                      isContr: P61PACKINGMANUALVAR.iscontrol,
                      fnContr: (input) {
                        setState(() {
                          P61PACKINGMANUALVAR.iscontrol = input;
                        });
                      },
                      sValue: P61PACKINGMANUALVAR.ORDER,
                      returnfunc: (String s) {
                        P61PACKINGMANUALVAR.ORDER = s;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text("SELECT"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              // color: Colors.red,
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 120,
                        //       child: Column(
                        //         children: [
                        //           SizedBox(
                        //             height: 12,
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("PO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("Product NO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("CHEMICAL:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("PLANT:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("TANK:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("LOT. NO:"),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text("QTY:"),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 200,
                        //       child: Column(
                        //         children: [
                        //           SizedBox(
                        //             height: 12,
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Text(""),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               SizedBox(
                        //                 width: 200,
                        //                 child: Text(
                        //                   "",
                        //                   overflow: TextOverflow.fade,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                //
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("PACKING"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                //
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Text("CONFIRM PACKING"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 550,
                    height: 400,
                    // color: Colors.amber,
                    child: SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 2, bottom: 2),
                        child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: PicShowFront(base64: logo),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PicShowFront extends StatefulWidget {
  PicShowFront({Key? key, required this.base64}) : super(key: key);
  String base64;
  @override
  State createState() => new PicShowFrontState();
}

class PicShowFrontState extends State<PicShowFront> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64);
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}
