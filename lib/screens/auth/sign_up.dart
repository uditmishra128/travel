import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rideapp/screens/auth/login.dart';
import 'package:rideapp/utils/locator.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/layout_builder.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signup";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode? fullName, phone, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: CustomLayout(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset('assets/images/onBoard/droom.svg'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/auth/car_road.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              CustomButton(
                width: MediaQuery.of(context).size.width * .9,
                heigth: 40,
                label: 'Continue with Phone Number',
                color: blue1,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen(
                      phone: true,
                    );
                  }));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: black.withOpacity(.5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'or sign in with',
                        style: TextStyle(color: black.withOpacity(.5)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: black.withOpacity(.5)),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await authServ.googleLogin(context);
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      foregroundImage:
                          AssetImage('assets/images/auth/google_logo.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await authServ.fblogin(context);
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      foregroundImage:
                          AssetImage('assets/images/auth/facebook_logo.png'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'By continuing you agree that you have read and accept our',
                textAlign: TextAlign.justify,
                style: TextStyle(color: black, fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('T&C', style: textStyle7),
                  const Text(
                    ' and ',
                    style: TextStyle(color: black, fontSize: 12),
                  ),
                  Text('Policy Policy', style: textStyle7)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
