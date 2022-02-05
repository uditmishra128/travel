import 'package:flutter/material.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/layout_builder.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PhoneNumberScreen extends StatefulWidget {
  final bool phone;
  final FocusNode? focusNode;
  final TextEditingController? numberController;
  final bool loading;
  final bool? isButtonActivate;
  final Function()? onTap;
  const PhoneNumberScreen(
      {this.numberController,
      this.focusNode,
      this.phone = false,
      this.loading = false,
      this.isButtonActivate,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(color: grey));
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(top: kToolbarHeight / 2, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blueGrey.withOpacity(.8)),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.phone
                      ? 'Enter Phone Number'
                      : 'Almost done! Enter Mobile Number to continue',
                  style: textStyle8,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'You shall receive an SMS with code for verification',
                  style: TextStyle(
                      color: black.withOpacity(.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PhoneFieldHint(
              child: TextField(
                cursorColor: black,
                style: const TextStyle(fontSize: 18),
                focusNode: widget.focusNode,
                autofocus: true,
                autofillHints: const [AutofillHints.telephoneNumberLocal],
                decoration: InputDecoration(
                  isDense: true,
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  prefix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/auth/India.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '+91',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: black,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ],
                  ),
                ),
                controller: widget.numberController,
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
              heigth: 50,
              width: MediaQuery.of(context).size.width * .9,
              loading: widget.loading,
              label: 'Send OTP',
              color: black.withOpacity(.7),
              onTap: widget.isButtonActivate! ? widget.onTap : null),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
