import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/20-1-registerpo.dart';
import '../bloc/BlocEvent/20-2-checkregis.dart';
import '../bloc/cubit/NotificationEvent.dart';
import '../widget/common/ComInputText.dart';

import 'P20REGISTORAP/P20REGISTORAPmain.dart';
import 'P21REGISTERAPHIS/P21REGISTERAPHISmain.dart';
import 'P31QCSAPMASTER/P31QCSAPMASTERmain.dart';
import 'P32SENDTOSAPHIS/P32SENDTOSAPHISmain.dart';

// bool isPOINPUT = false;
// String POINPUT = '';

class Page31 extends StatelessWidget {
  const Page31({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page31Body();
  }
}

class Page31Body extends StatelessWidget {
  Page31Body({
    Key? key,
    this.data,
    this.Listdata,
  }) : super(key: key);
  int? data;
  List<checkregisc>? Listdata;
  @override
  Widget build(BuildContext context) {
    return P31QCSAPMASTERmain();
  }
}
