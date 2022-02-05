import 'package:flutter/material.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';

class GenderContainer extends StatelessWidget {
  final bool? active;
  final String? label;
  final Function()? onTap;
  const GenderContainer({this.onTap, this.label, this.active, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration _decoration =
        BoxDecoration(color: blue1, borderRadius: BorderRadius.circular(4));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        decoration: active! ? _decoration : _decoration.copyWith(color: grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label!,
            textAlign: TextAlign.center,
            style: bodyStyle(
                context: context,
                size: 20,
                color: active! ? Colors.white : black.withOpacity(.5)),
          ),
        ),
      ),
    );
  }
}
