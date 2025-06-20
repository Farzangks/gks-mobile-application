import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/globle_functions.dart';
import 'package:itq_utils/itq_utils.dart';


class CustomAppStackLoader extends StatelessWidget {
  final bool visible;
  final Widget child;

  const CustomAppStackLoader({Key? key, required this.visible, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        GlobalFunction().progressBar().center().visible(visible.validate()),
      ],
    );
  }
}
