// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P231-01-P221FINISHEDGOODTRANFERget.dart';

import 'P231FINISHEDGOODTRANFER/P231FINISHEDGOODTRANFER.dart';

//---------------------------------------------------------

class Page231 extends StatelessWidget {
  const Page231({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page231BlocTableBody();
  }
}

class Page231BlocTableBody extends StatelessWidget {
  const Page231BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P231FINISHEDGOODTRANFERget_Bloc(),
        child: BlocBuilder<P231FINISHEDGOODTRANFERget_Bloc,
            List<P231FINISHEDGOODTRANFERgetclass>>(
          builder: (context, data) {
            return Page231Body(
              data: data,
            );
          },
        ));
  }
}

class Page231Body extends StatelessWidget {
  Page231Body({
    super.key,
    this.data,
  });
  List<P231FINISHEDGOODTRANFERgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P231FINISHEDGOODTRANFER(
      data: data,
    );
  }
}
