import 'package:flutter/material.dart';

class CheckBoxC extends StatefulWidget {
  CheckBoxC({Key? key, required this.getChbox, required this.value})
      : super(key: key);
  Function(bool)? getChbox;
  bool? value;

  @override
  State<CheckBoxC> createState() => _CheckBoxCState();
}

class _CheckBoxCState extends State<CheckBoxC> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.resolveWith(getColor),
      value: widget.value,
      onChanged: (bool? value) {
        widget.getChbox!(value!);
      },
    );
  }
}
