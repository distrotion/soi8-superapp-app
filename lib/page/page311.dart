// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P311-01-P26PROGRESSGETDATAFG.dart';
import '../bloc/BlocEvent/P311-02-P26TANKDATAPACKINGFG.dart';

import 'P311CHEMTANKFG/P311CHEMTANKFGMAIN.dart';

//---------------------------------------------------------

class Page311 extends StatelessWidget {
  const Page311({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page311blockget();
  }
}

class Page311blockget extends StatelessWidget {
  const Page311blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P311CHEMTANKGETFGDATA_Bloc(),
        child: BlocBuilder<P311CHEMTANKGETFGDATA_Bloc,
            List<P311CHEMTANKGETFGDATAclass>>(
          builder: (context, data) {
            return Page311blockget2(
              data: data,
            );
          },
        ));
  }
}

class Page311blockget2 extends StatelessWidget {
  Page311blockget2({
    super.key,
    this.data,
  });
  List<P311CHEMTANKGETFGDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P311TANKDATAPACKINGFG_Bloc(),
        child:
            BlocBuilder<P311TANKDATAPACKINGFG_Bloc, P311TANKDATAPACKINGFGclass>(
          builder: (context, wg) {
            return Page311Body(
              data: data,
              wg: wg,
            );
          },
        ));
  }
}

class Page311Body extends StatelessWidget {
  Page311Body({
    super.key,
    this.data,
    this.wg,
  });
  List<P311CHEMTANKGETFGDATAclass>? data;
  P311TANKDATAPACKINGFGclass? wg;
  @override
  Widget build(BuildContext context) {
    return P311CHEMTANKFG(
      data: data,
      wg: wg,
    );
  }
}
