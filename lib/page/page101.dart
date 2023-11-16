import 'package:flutter/material.dart';

import 'P101mainmappage/P101mainmappagemain.dart';

class Page101 extends StatelessWidget {
  const Page101({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page101Body();
  }
}

class Page101Body extends StatelessWidget {
  const Page101Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return P101mainmappagemain();
  }
}
