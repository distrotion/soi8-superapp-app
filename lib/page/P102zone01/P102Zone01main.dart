import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widget/table/mastertablewidget.dart';
import 'P102-01-Zone01MASTERTABLE.dart';
import 'P102-02-Zone01NEWITEM.dart';
import 'P102-03-Zone01GETITEM.dart';
import 'P102-04-Zone01RETURNITEM.dart';

int _page = 0;

class P102Zone01main extends StatefulWidget {
  const P102Zone01main({super.key});

  @override
  State<P102Zone01main> createState() => _P102Zone01mainState();
}

class _P102Zone01mainState extends State<P102Zone01main> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              width: 1280,
              child: Center(
                  child: Text(
                "Zone 01",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 720,
              width: 1280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_page == 0) ...[
                    MASTER_TABLE_P(),
                  ] else if (_page == 1) ...[
                    NEW_ITEM_P(),
                  ] else if (_page == 2) ...[
                    GET_ITEM(),
                  ] else if (_page == 3) ...[
                    RETURN_ITEM(),
                  ],
                  Container(
                    height: 680,
                    width: 300,
                    // color: Colors.amber,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 12, bottom: 12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _page = 0;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: _page == 0 ? Colors.blue : Colors.red,
                              child: Center(child: Text("MASTER TABLE")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 12, bottom: 12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _page = 1;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: _page == 1 ? Colors.blue : Colors.red,
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
                                _page = 2;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: _page == 2 ? Colors.blue : Colors.red,
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
                                _page = 3;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 280,
                              color: _page == 3 ? Colors.blue : Colors.red,
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
