// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P310-01-P26PROGRESSGETDATA.dart';
import '../bloc/BlocEvent/P310-02-P26TANKDATAPACKING.dart';
import 'P310CHEMTANK/P310CHEMTANKMAIN.dart';

//---------------------------------------------------------

class Page310 extends StatelessWidget {
  const Page310({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page310blockget();
  }
}

class Page310blockget extends StatelessWidget {
  const Page310blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P310CHEMTANKGETDATA_Bloc(),
        child: BlocBuilder<P310CHEMTANKGETDATA_Bloc,
            List<P310CHEMTANKGETDATAclass>>(
          builder: (context, data) {
            return Page310blockget2(
              data: data,
            );
          },
        ));
  }
}

class Page310blockget2 extends StatelessWidget {
  Page310blockget2({
    super.key,
    this.data,
  });
  List<P310CHEMTANKGETDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P26TANKDATAPACKING_Bloc(),
        child: BlocBuilder<P26TANKDATAPACKING_Bloc, P26TANKDATAPACKINGclass>(
          builder: (context, wg) {
            return Page310Body(
              data: data,
              wg: wg,
            );
          },
        ));
  }
}

class Page310Body extends StatelessWidget {
  Page310Body({
    super.key,
    this.data,
    this.wg,
  });
  List<P310CHEMTANKGETDATAclass>? data;
  P26TANKDATAPACKINGclass? wg;
  @override
  Widget build(BuildContext context) {
    return P310CHEMTANKMAIN(
      data: data,
      wg: wg,
    );
  }
}
