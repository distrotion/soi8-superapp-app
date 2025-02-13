import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/20-1-registerpo.dart';
import '../bloc/BlocEvent/20-2-checkregis.dart';
import '../bloc/BlocEvent/42-01-P42INCOMINGOPMAIN.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P20REGISTORAP/P20REGISTORAPmain.dart';
import 'P21REGISTERAPHIS/P21REGISTERAPHISmain.dart';
import 'P32SENDTOSAPHIS/P32SENDTOSAPHISmain.dart';
import 'P42INCOMINGOP/P42INCOMINGOPMAIN.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page42 extends StatelessWidget {
  const Page42({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page42BlocTableBody();
  }
}

class Page42BlocTableBody extends StatelessWidget {
  const Page42BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P42INCOMINGOPMAIN__Bloc(),
        child:
            BlocBuilder<P42INCOMINGOPMAIN__Bloc, List<P42INCOMINGOPMAINclass>>(
          builder: (context, data) {
            return Page42Body(
              data: data,
            );
          },
        ));
  }
}

class Page42Body extends StatelessWidget {
  Page42Body({
    Key? key,
    this.data,
  }) : super(key: key);
  List<P42INCOMINGOPMAINclass>? data;

  @override
  Widget build(BuildContext context) {
    return P42INCOMINGOPMAIN(
      data: data,
    );
  }
}
