// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P211-01-P211CHEMPLANINGget.dart';

import 'P211CHEMPLANING/P211CHEMPLANING.dart';

//---------------------------------------------------------

class Page211 extends StatelessWidget {
  const Page211({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page211BlocTableBody();
  }
}

class Page211BlocTableBody extends StatelessWidget {
  const Page211BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P211CHEMPLANINGget_Bloc(),
        child:
            BlocBuilder<P211CHEMPLANINGget_Bloc, List<P211CHEMPLANINGgetclass>>(
          builder: (context, data) {
            return Page211Body(
              data: data,
            );
          },
        ));
  }
}

class Page211Body extends StatelessWidget {
  Page211Body({
    super.key,
    this.data,
  });
  List<P211CHEMPLANINGgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P211CHEMPLANING(
      data: data,
    );
  }
}
