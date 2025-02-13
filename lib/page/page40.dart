import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/20-1-registerpo.dart';
import '../bloc/BlocEvent/20-2-checkregis.dart';
import '../bloc/BlocEvent/40-01-P40MASTERINCOMING.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P40MASTERINCOMING/P40MASTERINCOMINGMAIN.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page40 extends StatelessWidget {
  const Page40({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page40BlocTableBody();
  }
}

class Page40BlocTableBody extends StatelessWidget {
  const Page40BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P40MASTERINCOMING__Bloc(),
        child:
            BlocBuilder<P40MASTERINCOMING__Bloc, List<P40MASTERINCOMINGclass>>(
          builder: (context, data) {
            return Page40Body(
              data: data,
            );
          },
        ));
  }
}

class Page40Body extends StatelessWidget {
  Page40Body({
    Key? key,
    this.data,
  }) : super(key: key);

  List<P40MASTERINCOMINGclass>? data;
  @override
  Widget build(BuildContext context) {
    return P40MASTERINCOMINGMAIN(
      data: data,
    );
  }
}
