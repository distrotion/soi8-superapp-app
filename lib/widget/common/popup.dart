import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//------------------------------------

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/page1.dart';
import 'ComPro_text.dart';

void WORNINGpop(
    BuildContext contextin, List<String> text, double? height, double? width) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: height ?? 75,
            width: width ?? 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(contextin);
                      },
                      child: const SizedBox(
                        height: 24,
                        width: 36,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Center(child: Icon(Icons.close)),
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < text.length; i++) Com_Text(str: text[i]),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
      );
    },
  );
}

void WORNINGPatMoveZonepop(
  BuildContext contextin,
  List<String> text,
  double? height,
  double? width,
) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: height ?? 75,
            width: width ?? 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < text.length; i++) Text(text[i]),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  InkWell(
                    onTap: () {
                      CuPage = Page1();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                      Navigator.pop(contextin);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xff230a38),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          'ตกลง',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    },
  );
}

void WORNINGpopB1(
    BuildContext contextin, List<String> text, double? height, double? width) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: height ?? 75,
            width: width ?? 100,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 10, bottom: 10, start: 20, end: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(contextin);
                      },
                      child: const SizedBox(
                        height: 24,
                        width: 36,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Center(child: Icon(Icons.close)),
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < text.length; i++) Text(text[i]),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
      );
    },
  );
}

void ComingSoonPop(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: SizedBox(
            height: 450,
            width: 800,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(contextin);
                      },
                      child: const SizedBox(
                        height: 24,
                        width: 36,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Center(child: Icon(Icons.close)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 264,
                    height: 136,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage('assets/images/fill-1@3x.png'))),
                    child: Image.network(
                        "https://happo.sgp1.digitaloceanspaces.com/ManagementAssets/images/fill-1@3x.png",
                        fit: BoxFit.cover, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.grey,
                      );
                    }),
                  ),
                  const SizedBox(height: 50),
                  Com_Text(
                    str: "Coming Soon...",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            )),
      );
    },
  );
}

void AreYouSurePopUp(BuildContext contextin, Function(String) fnConfirm,
    String textHeader, String textBody) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          width: 782,
          height: 464,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(contextin);
                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Center(child: Icon(Icons.close, size: 36)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 264,
                        height: 136,
                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage("assets/images/fill-1@3x.png"),
                        //   ),
                        // ),
                        child: Image.network(
                          "https://happo.sgp1.digitaloceanspaces.com/ManagementAssets/images/fill-1@3x.png",
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                      Com_Text(
                        str: textHeader,
                        fontSize: 32,
                      ),
                      Com_Text(
                        str: textBody,
                        fontSize: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(contextin);
                              if (fnConfirm != null) {
                                fnConfirm("Confirm");
                              }
                            },
                            child: Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xffff884f),
                                ),
                                color: const Color(0xffff884f),
                              ),
                              child: Center(
                                child: Com_Text(
                                  str: "Yes, I'm sure",
                                  fontSize: 24,
                                  // textAlign: TextAlign.center,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(contextin);
                            },
                            child: Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xffff884f),
                                ),
                              ),
                              child: Center(
                                child: Com_Text(
                                  str: "No, I'm regratted",
                                  fontSize: 24,
                                  // textAlign: TextAlign.center,
                                  color: const Color(0xffff884f),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void PagePop(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
          //     child: Page11(
          //   contextin: contextin,
          // )
          );
    },
  );
}
