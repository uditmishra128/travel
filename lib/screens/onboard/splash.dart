import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rideapp/handlers/auth.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    await checkUserState(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset('assets/images/onBoard/droom.svg'),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset('assets/animations/bike_animation.json',
                  animate: true, repeat: false, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
