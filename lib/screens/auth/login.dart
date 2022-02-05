import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/handlers/auth.dart';
import 'package:rideapp/provider/auth.dart';
import 'package:rideapp/screens/auth/phone.dart';
import 'package:rideapp/screens/auth/otp_screen.dart';
import 'package:rideapp/utils/meta.dart';

class LoginScreen extends StatefulWidget {
  final bool phone;
  const LoginScreen({this.phone = false, Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode? phone;
  bool isButtonActivate = false;
  bool otpSend = false;
  bool verifying = false;
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(color: grey));
  @override
  void initState() {
    phone = FocusNode();
    numberController.addListener(() {
      if (numberController.text.startsWith('+91')) {
        numberController.text = numberController.text.substring(3);
      }
      final isButtonActivate = numberController.text.length == 10;
      setState(() {
        this.isButtonActivate = isButtonActivate;
      });
    });
    super.initState();
  }

  authenticate() async {
    await authenticateUser(context, '+91${numberController.text}');
    setState(() {
      otpSend = true;
    });
  }

  loginwithOtp() async {
    setState(() {
      verifying = true;
    });
    String? uid = await Provider.of<AuthProvider>(context, listen: false)
        .signInWithPhoneNumber(otpController.text);
    if (uid != null) {
      await redirectUser(context);
    } else {
      setState(() {
        otpSend = false;
        verifying = false;
      });
    }
    setState(() {
      verifying = false;
    });
  }

  @override
  void dispose() {
    phone!.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: authProvider.status != Status.otpSend && !otpSend && !verifying
            ? PhoneNumberScreen(
                numberController: numberController,
                focusNode: phone,
                phone: widget.phone,
                loading: otpSend,
                isButtonActivate: isButtonActivate,
                onTap: () {
                  if (!otpSend) authenticate();
                })
            : OtpScreen(numberController.text, otpController, () async {
                loginwithOtp();
              }, verifying),
      ),
    );
  }
}
