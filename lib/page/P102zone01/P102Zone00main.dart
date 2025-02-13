import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/table/mastertablewidget.dart';
import '../page101.dart';
import 'P102-01-ZONE00MASTERTABLE.dart';
import 'P102-02-ZONE00NEWITEM.dart';
import 'P102-03-ZONE00GETITEM.dart';
import 'P102-04-ZONE00RETURNITEM.dart';
import 'Zone00VAR.dart';

class P102ZONE00main extends StatefulWidget {
  const P102ZONE00main({super.key});

  @override
  State<P102ZONE00main> createState() => _P102ZONE00mainState();
}

class _P102ZONE00mainState extends State<P102ZONE00main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ZONE00MAINVAR.page = 0;
  }

  @override
  Widget build(BuildContext context) {
    double resp = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        CuPage = Page101();

                        MainBodyContext.read<ChangePage_Bloc>()
                            .add(ChangePage_nodrower());
                      },
                      child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: SizedBox(
                        height: 100,
                        // width: 1280,
                        child: Center(
                            child: Text(
                          "Zone RM-2",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 720,
                    // width: 1280,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (ZONE00MAINVAR.page == 0) ...[
                          MASTER_TABLE_P(),
                        ] else if (ZONE00MAINVAR.page == 1) ...[
                          NEW_ITEM_P(),
                        ] else if (ZONE00MAINVAR.page == 2) ...[
                          GET_ITEM(),
                        ] else if (ZONE00MAINVAR.page == 3) ...[
                          RETURN_ITEM(),
                        ],
                        if (resp > 800) ...[
                          Container(
                            height: 680,
                            width: 300,
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                if (USERDATA.UserLV > 10) ...[
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 12, bottom: 12),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ZONE00MAINVAR.page = 0;
                                        });
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 280,
                                        color: ZONE00MAINVAR.page == 0
                                            ? Colors.blue
                                            : Colors.red,
                                        child:
                                            Center(child: Text("MASTER TABLE")),
                                      ),
                                    ),
                                  ),
                                ],
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 12, bottom: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        ZONE00MAINVAR.page = 1;
                                      });
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 280,
                                      color: ZONE00MAINVAR.page == 1
                                          ? Colors.blue
                                          : Colors.red,
                                      child: Center(child: Text("Receive")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 12, bottom: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        ZONE00MAINVAR.page = 2;
                                      });
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 280,
                                      color: ZONE00MAINVAR.page == 2
                                          ? Colors.blue
                                          : Colors.red,
                                      child: Center(child: Text("ISSUE")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 12, bottom: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        ZONE00MAINVAR.page = 3;
                                      });
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 280,
                                      color: ZONE00MAINVAR.page == 3
                                          ? Colors.blue
                                          : Colors.red,
                                      child: Center(child: Text("RETURN ITEM")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (resp <= 800) ...[
            Align(
              alignment: Alignment(1, 1),
              child: Row(
                children: [
                  if (USERDATA.UserLV > 10) ...[
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 12, bottom: 12, start: 6, end: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            ZONE00MAINVAR.page = 0;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 75,
                          color: ZONE00MAINVAR.page == 0
                              ? Colors.blue
                              : Colors.red,
                          child: Center(child: Text("MASTER TABLE")),
                        ),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 12, bottom: 12, start: 6, end: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ZONE00MAINVAR.page = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 75,
                        color:
                            ZONE00MAINVAR.page == 1 ? Colors.blue : Colors.red,
                        child: Center(child: Text("Receive")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 12, bottom: 12, start: 6, end: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ZONE00MAINVAR.page = 2;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 75,
                        color:
                            ZONE00MAINVAR.page == 2 ? Colors.blue : Colors.red,
                        child: Center(child: Text("ISSUE")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 12, bottom: 12, start: 6, end: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ZONE00MAINVAR.page = 3;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 75,
                        color:
                            ZONE00MAINVAR.page == 3 ? Colors.blue : Colors.red,
                        child: Center(child: Text("RETURN ITEM")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
