// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P221-01-P221PRODUCTIONCONFIRMATIONSMget.dart';

import 'P221PRODUCTIONCONFIRMATIONSM/P221PRODUCTIONCONFIRMATIONSM.dart';

//---------------------------------------------------------

class Page221 extends StatelessWidget {
  const Page221({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page221BlocTableBody();
  }
}

class Page221BlocTableBody extends StatelessWidget {
  const Page221BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P221PRODUCTIONCONFIRMATIONSMget_Bloc(),
        child: BlocBuilder<P221PRODUCTIONCONFIRMATIONSMget_Bloc,
            List<P221PRODUCTIONCONFIRMATIONSMgetclass>>(
          builder: (context, data) {
            return Page221Body(
              data: data,
            );
          },
        ));
  }
}

class Page221Body extends StatelessWidget {
  Page221Body({
    super.key,
    this.data,
  });
  List<P221PRODUCTIONCONFIRMATIONSMgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P221PRODUCTIONCONFIRMATIONSM(
      data: data,
    );
  }
}
