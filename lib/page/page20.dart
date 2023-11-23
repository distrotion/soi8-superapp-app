import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/20-1-registerpo.dart';
import '../bloc/BlocEvent/20-2-checkregis.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P20REGISTORAP/P20REGISTORAPmain.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page20 extends StatelessWidget {
  const Page20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page20BlocBody();
  }
}

class Page20BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page20BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RegisterPOID_Bloc(),
        child: BlocBuilder<RegisterPOID_Bloc, int>(
          builder: (context, data) {
            return Page20BlocBodyList(
              data: data,
            );
          },
        ));
  }
}

class Page20BlocBodyList extends StatelessWidget {
  /// {@macro counter_page}
  Page20BlocBodyList({
    Key? key,
    this.data,
  }) : super(key: key);
  int? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => checkregis_Bloc(),
        child: BlocBuilder<checkregis_Bloc, List<checkregisc>>(
          builder: (context, Listdata) {
            return Page20Body(
              data: data,
              Listdata: Listdata,
            );
          },
        ));
  }
}

class Page20Body extends StatelessWidget {
  Page20Body({
    Key? key,
    this.data,
    this.Listdata,
  }) : super(key: key);
  int? data;
  List<checkregisc>? Listdata;
  @override
  Widget build(BuildContext context) {
    return RegisterBox(
      data: data,
      Listdata: Listdata,
    );
  }
}
