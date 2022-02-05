import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rideapp/screens/dashboard/dashboard.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/layout_builder.dart';

class LocationAccess extends StatefulWidget {
  const LocationAccess({Key? key}) : super(key: key);

  @override
  _LocationAccessState createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLayout(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            SvgPicture.asset(
              'assets/images/onBoard/droom.svg',
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .7,
            ),
            Text(
              'Location permission nedded',
              style: textStyle8.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'To have a comfortable ride experience with us,please allow us the location permission.',
              textAlign: TextAlign.center,
              style: textStyle9,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  foregroundImage:
                      AssetImage('assets/images/auth/location_icon.jpeg'),
                ),
                Text(
                  'Location: to locate you and get rides easily.',
                  overflow: TextOverflow.ellipsis,
                  style: textStyle9.copyWith(fontSize: 14),
                )
              ],
            ),
            const Spacer(),
            CustomButton(
                heigth: 50,
                width: MediaQuery.of(context).size.width * .9,
                label: 'Allow Location Permission',
                color: blue1,
                onTap: () {
                  Navigator.pushNamed(context, DashBoardScreen.routeName);
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
