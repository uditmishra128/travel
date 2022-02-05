import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/provider/auth.dart';
import 'package:rideapp/screens/auth/sign_up.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/layout_builder.dart';

class DashBoardScreen extends StatefulWidget {
  static String routeName = '/dash';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(22.719568, 75.857727),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: SizedBox(
              height: 55,
              width: 100,
              child: SvgPicture.asset(
                'assets/images/onBoard/droom.svg',
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              CustomButton(
                label: 'sign out',
                heigth: 30,
                width: 50,
                color: blue1,
                onTap: () async {
                  await authProvider.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
              ),
            ],
          ),
          body: CustomLayout(
            child: Stack(
              children: [GoogleMap(initialCameraPosition: _kGooglePlex)],
            ),
          ),
        ));
  }
}
