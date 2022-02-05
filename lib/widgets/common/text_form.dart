import 'package:flutter/material.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';

class CustomTextForm extends StatelessWidget {
  final FocusNode? currentFocus;
  final String? label;

  final String? hint;
  final TextInputType? inputType;
  final String? Function(String?)? validatorFn;
  final String Function(String?)? onFieldSubmitted;
  final String Function(String?)? onChanged;
  final Widget? prefix;
  final TextEditingController? controller;
  final Color? feildBorderColor;
  const CustomTextForm(
      {this.controller,
      this.currentFocus,
      this.hint,
      this.inputType,
      this.onChanged,
      this.onFieldSubmitted,
      this.prefix,
      this.validatorFn,
      this.feildBorderColor,
      this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
        borderSide: BorderSide(color: feildBorderColor!));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            text: TextSpan(
                text: label,
                style: textStyle(black, 15, FontWeight.bold, 'Poppins'),
                children: [
                  TextSpan(
                    text: " *",
                    style: textStyle(red, 14, FontWeight.w600, 'NunitoSans'),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: TextFormField(
            controller: controller,
            cursorColor: black,
            focusNode: currentFocus,
            textInputAction: TextInputAction.next,
            style: textStyle6,
            keyboardType: inputType,
            decoration: InputDecoration(
                filled: true,
                fillColor: grey,
                enabledBorder: border,
                border: border,
                errorBorder: border,
                disabledBorder: border,
                focusColor: black,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                hintText: hint,
                focusedBorder:
                    border.copyWith(borderSide: const BorderSide(color: black)),
                hintStyle: textStyle5,
                prefixIcon: prefix),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatorFn,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
