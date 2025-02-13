import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/20-1-registerpo.dart';
import '../bloc/BlocEvent/20-2-checkregis.dart';
import '../bloc/BlocEvent/41-01-P41PATTERNNCOMING.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P20REGISTORAP/P20REGISTORAPmain.dart';
import 'P21REGISTERAPHIS/P21REGISTERAPHISmain.dart';
import 'P32SENDTOSAPHIS/P32SENDTOSAPHISmain.dart';
import 'P41PATTERNNCOMING/P41PATTERNNCOMINGMAIN.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page41 extends StatelessWidget {
  const Page41({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page41BlocTableBody();
  }
}

class Page41BlocTableBody extends StatelessWidget {
  const Page41BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P41PATTERNNCOMING__Bloc(),
        child:
            BlocBuilder<P41PATTERNNCOMING__Bloc, List<P41PATTERNNCOMINGclass>>(
          builder: (context, data) {
            return Page41Body(
              data: data,
            );
          },
        ));
  }
}

class Page41Body extends StatelessWidget {
  Page41Body({
    Key? key,
    this.data,
  }) : super(key: key);

  List<P41PATTERNNCOMINGclass>? data;
  @override
  Widget build(BuildContext context) {
    return P41PATTERNNCOMINGINCOMINGMAIN(
      data: data,
    );
  }
}
