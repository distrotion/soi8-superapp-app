import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/table/mastertablewidget.dart';
import '../page101.dart';
import 'P102-01-Zone01MASTERTABLE.dart';
import 'P102-02-Zone01NEWITEM.dart';
import 'P102-03-Zone01GETITEM.dart';
import 'P102-04-Zone01RETURNITEM.dart';
import 'Zone01VAR.dart';

class P102Zone01main extends StatefulWidget {
  const P102Zone01main({super.key});

  @override
  State<P102Zone01main> createState() => _P102Zone01mainState();
}

class _P102Zone01mainState extends State<P102Zone01main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Zone01MAINVAR.page = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
                      "Zone 01",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 720,
              width: 1280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (Zone01MAINVAR.page == 0) ...[
                    MASTER_TABLE_P(),
                  ] else if (Zone01MAINVAR.page == 1) ...[
                    NEW_ITEM_P(),
                  ] else if (Zone01MAINVAR.page == 2) ...[
                    GET_ITEM(),
                  ] else if (Zone01MAINVAR.page == 3) ...[
                    RETURN_ITEM(),
                  ],
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
                                  Zone01MAINVAR.page = 0;
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 280,
                                color: Zone01MAINVAR.page == 0
                                    ? Colors.blue
                                    : Colors.red,
                                child: Center(child: Text("MASTER TABLE")),
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
                                Zone01MAINVAR.page = 1;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: Zone01MAINVAR.page == 1
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
                                Zone01MAINVAR.page = 2;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: Zone01MAINVAR.page == 2
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
                                Zone01MAINVAR.page = 3;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: Zone01MAINVAR.page == 3
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
