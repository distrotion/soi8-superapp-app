import 'package:flutter/material.dart';

class laooutRM2 extends StatelessWidget {
  const laooutRM2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: 600,
          // width: 1000,
          // color: Colors.amber,
          child: Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  Container(
                    height: 120,
                    width: 170,
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 160,
                          color: Colors.red.shade100,
                          child: Center(child: Text("300 pcs")),
                        ),
                        Container(
                          height: 50,
                          width: 160,
                          color: Colors.yellow,
                          child: Center(child: Text("127 pcs")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 300,
                    width: 70,
                    color: Colors.red,
                    child: Center(
                      child: Text("ทางเดิน"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 300,
                    width: 170,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.yellowAccent,
                                child: Center(child: Text("2 packs")),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.yellowAccent,
                                child: Center(child: Text("1 packs")),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                                child: Center(child: Text("3 packs")),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
