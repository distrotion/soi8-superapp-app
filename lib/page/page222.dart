// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P222-01-P222PRODUCTIONCONFIRMATIONFGget.dart';

import 'P222PRODUCTIONCONFIRMATIONFG/P222PRODUCTIONCONFIRMATIONFG.dart';

//---------------------------------------------------------

class Page222 extends StatelessWidget {
  const Page222({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page222BlocTableBody();
  }
}

class Page222BlocTableBody extends StatelessWidget {
  const Page222BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P222PRODUCTIONCONFIRMATIONFGget_Bloc(),
        child: BlocBuilder<P222PRODUCTIONCONFIRMATIONFGget_Bloc,
            List<P222PRODUCTIONCONFIRMATIONFGgetclass>>(
          builder: (context, data) {
            return Page222Body(
              data: data,
            );
          },
        ));
  }
}

class Page222Body extends StatelessWidget {
  Page222Body({
    super.key,
    this.data,
  });
  List<P222PRODUCTIONCONFIRMATIONFGgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P222PRODUCTIONCONFIRMATIONFG(
      data: data,
    );
  }
}
