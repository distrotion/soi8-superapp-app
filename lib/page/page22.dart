import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/22-1-01-SumReportGET.dart';
import 'P22GETWEIGHTLIST/P22GETWEIGHTLISTmain.dart';

class Page22 extends StatelessWidget {
  const Page22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page22BlocTableBody();
  }
}

class Page22BlocTableBody extends StatelessWidget {
  const Page22BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GETWEIGHTLISTSGET_Bloc(),
        child: BlocBuilder<GETWEIGHTLISTSGET_Bloc, datauoutraw>(
          builder: (context, datain) {
            return Page22Body();
          },
        ));
  }
}

class Page22Body extends StatelessWidget {
  const Page22Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GETWEIGHTLISTmain();
  }
}
