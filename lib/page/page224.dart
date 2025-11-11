// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P224-01-P221PRODUCTIONCONFIRMATIONSMYMget.dart';
import 'P224P221PRODUCTIONCONFIRMATIONSMYE/P224PRODUCTIONCONFIRMATIONSMYE.dart';

//---------------------------------------------------------

class Page224 extends StatelessWidget {
  const Page224({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page224BlocTableBody();
  }
}

class Page224BlocTableBody extends StatelessWidget {
  const Page224BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P224PRODUCTIONCONFIRMATIONSMYEget_Bloc(),
        child: BlocBuilder<P224PRODUCTIONCONFIRMATIONSMYEget_Bloc,
            List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>>(
          builder: (context, data) {
            return Page224Body(
              data: data,
            );
          },
        ));
  }
}

class Page224Body extends StatelessWidget {
  Page224Body({
    super.key,
    this.data,
  });
  List<P224PRODUCTIONCONFIRMATIONSMYEgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P224PRODUCTIONCONFIRMATIONSMYE(
      data: data,
    );
  }
}
