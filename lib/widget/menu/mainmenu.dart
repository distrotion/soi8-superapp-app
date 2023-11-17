import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/LoginEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/page1.dart';
import '../../page/page101.dart';
import '../../page/page2.dart';
import '../../page/page3.dart';
import '../../page/page4.dart';
import '../../page/page5.dart';
import 'sub_widget.dart';

late BuildContext MenuContext;

bool menu_PD = false;
bool menu_QC = false;
bool menu_MFT = false;
bool menu_RM = false;
bool menu_DL = false;

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    MenuContext = context;
    //---------------------------------------------------------------

    return Container(
      height: (MediaQuery.of(context).size.height),
      width: 200,
      color: const Color(0xff0b1327),
      //color: Colors.red,
      child: ListView(
        children: [
          Center(
            child: Data_Menu_mainmenu(),
          )
        ],
      ),
    );
  }
}

class Data_Menu_mainmenu extends StatefulWidget {
  @override
  State<Data_Menu_mainmenu> createState() => _Data_Menu_mainmenuState();
}

class _Data_Menu_mainmenuState extends State<Data_Menu_mainmenu> {
  //const Data_Menu_mainmenu({Key? key},this.pagein) : super(key: key);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menu_PD = false;
    menu_QC = false;
    menu_MFT = false;
    menu_RM = false;
    menu_DL = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //Axis-Y
      crossAxisAlignment: CrossAxisAlignment.center, //Axis-X

      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 40,
            width: 180,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(1),
              child: Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo_tpk.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ),
        // menu_normal(
        //   name: "Page1",
        //   page: Page1(),
        //   Lv: 1,
        // ),
        // menu_normal(
        //   name: "Page2",
        //   page: Page2(),
        //   Lv: 1,
        // ),
        // menu_normal(
        //   name: "Page3",
        //   page: Page3(),
        //   Lv: 1,
        // ),
        // menu_normal(
        //   name: "Page4",
        //   page: Page4(),
        //   Lv: 1,
        // ),
        // menu_normal(
        //   name: "Page5",
        //   page: Page5(),
        //   Lv: 5,
        // ),
        if (USERDATA.PD == 'true') ...[
          InkWell(
            onTap: () {
              setState(() {
                if (menu_PD) {
                  menu_PD = false;
                } else {
                  menu_PD = true;
                }
              });
            },
            child: SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        child: Icon(
                          menu_PD
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(getShowHidePassword_ImgPath()),
                        //         fit: BoxFit.fitHeight))
                      ),
                    ),
                    const Text(
                      "Production",
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu_PD) ...[
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  menu_sub(
                    name: "test",
                    page: Page1(),
                    Lv: 1,
                  ),
                ],
              ),
            )
          ] else ...[
            const SizedBox(),
          ],
        ],
        if (USERDATA.QC == 'true') ...[
          InkWell(
            onTap: () {
              setState(() {
                if (menu_QC) {
                  menu_QC = false;
                } else {
                  menu_QC = true;
                }
              });
            },
            child: SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        child: Icon(
                          menu_QC
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(getShowHidePassword_ImgPath()),
                        //         fit: BoxFit.fitHeight))
                      ),
                    ),
                    const Text(
                      "Quality Control",
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu_QC) ...[
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  menu_sub(
                    name: "test",
                    page: Page1(),
                    Lv: 1,
                  ),
                ],
              ),
            )
          ] else ...[
            const SizedBox(),
          ],
        ],
        if (USERDATA.MFT == 'true') ...[
          InkWell(
            onTap: () {
              setState(() {
                if (menu_MFT) {
                  menu_MFT = false;
                } else {
                  menu_MFT = true;
                }
              });
            },
            child: SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        child: Icon(
                          menu_MFT
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(getShowHidePassword_ImgPath()),
                        //         fit: BoxFit.fitHeight))
                      ),
                    ),
                    const Text(
                      "MFT",
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu_MFT) ...[
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  menu_sub(
                    name: "test",
                    page: Page1(),
                    Lv: 1,
                  ),
                ],
              ),
            )
          ] else ...[
            const SizedBox(),
          ],
        ],
        if (USERDATA.RM == 'true') ...[
          InkWell(
            onTap: () {
              setState(() {
                if (menu_RM) {
                  menu_RM = false;
                } else {
                  menu_RM = true;
                }
              });
            },
            child: SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        child: Icon(
                          menu_RM
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(getShowHidePassword_ImgPath()),
                        //         fit: BoxFit.fitHeight))
                      ),
                    ),
                    const Text(
                      "RM",
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu_RM) ...[
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  menu_sub(
                    name: "STORE",
                    page: Page101(),
                    Lv: 1,
                  ),
                ],
              ),
            )
          ] else ...[
            const SizedBox(),
          ],
        ],
        if (USERDATA.DL == 'true') ...[
          InkWell(
            onTap: () {
              setState(() {
                if (menu_DL) {
                  menu_DL = false;
                } else {
                  menu_DL = true;
                }
              });
            },
            child: SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        child: Icon(
                          menu_DL
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(getShowHidePassword_ImgPath()),
                        //         fit: BoxFit.fitHeight))
                      ),
                    ),
                    const Text(
                      "DL",
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu_DL) ...[
            SizedBox(
              height: 40,
              child: Column(
                children: [
                  menu_sub(
                    name: "STORE",
                    page: Page101(),
                    Lv: 1,
                  ),
                ],
              ),
            )
          ] else ...[
            const SizedBox(),
          ],
        ],
        menu_logout(
          name: "Logout",
        ),
        const Divider(
          color: Color(0x4dffffff),
          height: 12,
        ),
      ],
    );
  }
}

class Logomenu extends StatelessWidget {
  const Logomenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsetsDirectional.all(1),
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo_tpk.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),

      //color: Colors.white,
    );
  }
}

class menu_logout extends StatelessWidget {
  menu_logout({Key? key, this.name}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        LoginContext.read<Login_Bloc>().add(Logout());
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        // CuPage = page;
        // CuPageLV = Lv;
        // MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
      },
      child: Container(
        //color: Colors.blue,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 24,
                width: 24,
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  // size: 30.0,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.redAccent.shade400,

                //   // image: DecorationImage(
                //   //   image: AssetImage(""),
                //   //   fit: BoxFit.fitWidth,
                //   // ),
                //   //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                // ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "   " + _name,
                style: const TextStyle(
                  fontFamily: 'Mitr',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
