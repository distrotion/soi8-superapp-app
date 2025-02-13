import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../page102.dart';
import '../page2.dart';
import '../page3.dart';
import '../page4.dart';
import '../page5.dart';

class P101mainmappagemain extends StatelessWidget {
  const P101mainmappagemain({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 720,
                width: 1280,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/IMG_8444.JPG"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.45, -0.28),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-6",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.35, -0.28),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-5",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.40, -0.17),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nCR-1",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.45, 0),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-1",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.35, 0),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-3",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.30, 0.12),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-2",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.23, 0),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-4",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.18, -0.35),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 75,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-4",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.10, -0.15),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-10",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.14, 0),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-9",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.2, 0.35),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 40,
                          width: 70,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nFG-8",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.02, -0.12),
                      child: InkWell(
                        onDoubleTap: () {
                          CuPage = Page102();

                          MainBodyContext.read<ChangePage_Bloc>()
                              .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          color: Colors.blue,
                          // color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-2",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.05, 0.05),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-1",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.05, 0.32),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 40,
                          width: 70,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-7",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.28, 0),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-11",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.42, -0.2),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-3",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.40, 0.37),
                      child: InkWell(
                        onDoubleTap: () {
                          // CuPage = Page102();

                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .add(ChangePage_nodrower());
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          // color: Colors.blue,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            "ZONE \nRM-3",
                            style: TextStyle(fontSize: 10),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 720,
                width: 150,
                // color: Colors.red,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                        height: 80,
                        width: 150,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
