import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P23GETWEIGHTLISTBYTANK/P23GETWEIGHTLISTBYTANKmain.dart';

class Page23 extends StatelessWidget {
  const Page23({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page23Body();
  }
}

class Page23Body extends StatelessWidget {
  const Page23Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GETWEIGHTLISTBYTANKmain();
  }
}
