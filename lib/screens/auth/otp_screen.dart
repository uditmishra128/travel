import 'package:flutter/material.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/layout_builder.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatelessWidget {
  final String number;
  final TextEditingController otpController;
  final bool loading;
  final Function() onTap;
  const OtpScreen(this.number, this.otpController, this.onTap, this.loading,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify the OTP \n send to $number',
                  style: textStyle8,
                ),
              ],
            ),
          ),
          Text(
            'Enter OTP',
            style: TextStyle(
                color: black.withOpacity(.8),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          PinFieldAutoFill(
            controller: otpController,
            codeLength: 6,
            decoration: BoxLooseDecoration(
              textStyle: const TextStyle(fontSize: 16, color: Colors.black),
              strokeColorBuilder:
                  FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            onCodeSubmitted: (code) {
              onTap;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          CustomButton(
              heigth: 50,
              width: MediaQuery.of(context).size.width * .9,
              label: 'Verify OTP',
              loading: loading,
              color: blue1,
              onTap: onTap),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
