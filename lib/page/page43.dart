import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/42-01-P42INCOMINGOPMAIN.dart';
import '../bloc/BlocEvent/43-01-P43SETRAWMAT.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P42INCOMINGOP/P42INCOMINGOPMAIN.dart';
import 'P43SETRAWMAT/P43SETRAWMATMAIN.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page43 extends StatelessWidget {
  const Page43({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page43BlocTableBody();
  }
}

class Page43BlocTableBody extends StatelessWidget {
  const Page43BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P43SETRAWMATMAIN__Bloc(),
        child: BlocBuilder<P43SETRAWMATMAIN__Bloc, List<P43SETRAWMATMAINclass>>(
          builder: (context, data) {
            return Page43Body(
              data: data,
            );
          },
        ));
  }
}

class Page43Body extends StatelessWidget {
  Page43Body({
    Key? key,
    this.data,
  }) : super(key: key);
  List<P43SETRAWMATMAINclass>? data;

  @override
  Widget build(BuildContext context) {
    return P43SETRAWMATMAIN(
      data: data,
    );
  }
}
