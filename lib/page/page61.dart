import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P61PACKINGMANUAL/P61PACKINGMANUALMAIN.dart';

class Page61 extends StatelessWidget {
  const Page61({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page61Body();
  }
}

class Page61Body extends StatelessWidget {
  const Page61Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return P61PACKINGMANUALMAIN();
  }
}
