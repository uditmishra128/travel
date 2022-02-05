import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const CustomLayout({this.child, this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: padding,
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: child,
            )),
      );
    });
  }
}
