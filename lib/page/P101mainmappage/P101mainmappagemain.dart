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
          child: Container(
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
                  alignment: Alignment(-0.45, 0),
                  child: InkWell(
                    onDoubleTap: () {
                      CuPage = Page102();

                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("ZONE01")),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.1, -0.15),
                  child: InkWell(
                    onDoubleTap: () {
                      // CuPage = Page3();

                      // MainBodyContext.read<ChangePage_Bloc>()
                      //     .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 35,
                      width: 75,
                      color: Colors.red,
                      child: Center(child: Text("ZONE02")),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.40, 0.35),
                  child: InkWell(
                    onDoubleTap: () {
                      // CuPage = Page4();

                      // MainBodyContext.read<ChangePage_Bloc>()
                      //     .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      child: Center(child: Text("ZONE03")),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.45, -0.15),
                  child: InkWell(
                    onDoubleTap: () {
                      // CuPage = Page5();

                      // MainBodyContext.read<ChangePage_Bloc>()
                      //     .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      child: Center(child: Text("ZONE04")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
