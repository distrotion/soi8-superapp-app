import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/60-02-P60SETRAWMAT.dart';
import '../bloc/cubit/Rebuild.dart';
import 'P60PRCESSMANUAL/P60PRCESSMANUALMAIN.dart';

class Page60 extends StatelessWidget {
  const Page60({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page60BlocTableBody();
  }
}

class Page60BlocTableBody extends StatelessWidget {
  const Page60BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => BlocPageRebuild(),
        child: BlocBuilder<BlocPageRebuild, bool>(
          builder: (context, data) {
            return _BlocTableBody();
          },
        ));
  }
}

class _BlocTableBody extends StatelessWidget {
  const _BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SETRAWMATMAIN__Bloc(),
        child: BlocBuilder<SETRAWMATMAIN__Bloc, List<SETRAWMATMAINclass>>(
          builder: (context, data) {
            return Page60Body();
          },
        ));
  }
}

class Page60Body extends StatelessWidget {
  const Page60Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return P60PRCESSMANUALMAIN();
  }
}
