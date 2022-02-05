import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rideapp/handlers/auth.dart';
import 'package:rideapp/screens/auth/location_access.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/utils/validators.dart';
import 'package:rideapp/widgets/auth/gender_container.dart';
import 'package:rideapp/widgets/common/button.dart';
import 'package:rideapp/widgets/common/text_form.dart';
import 'package:rideapp/widgets/layout_builder.dart';

class DetailScreen extends StatefulWidget {
  final String? email;
  const DetailScreen({this.email, Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  FocusNode? name;
  String gender = 'male';
  bool registor = false;
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _detailKey = GlobalKey<FormState>();
  @override
  void dispose() {
    name!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    name = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomLayout(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight / 2,
            ),
            Text(
              'Welcome',
              style: textStyle4,
            ),
            Text(
              'to',
              style: textStyle4.copyWith(fontFamily: 'Pacifico'),
            ),
            SvgPicture.asset('assets/images/onBoard/droom.svg'),
            Form(
              key: _detailKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextForm(
                    currentFocus: name,
                    label: 'Name',
                    hint: 'Enter your name',
                    inputType: TextInputType.name,
                    validatorFn: generalValidator,
                    controller: nameController,
                    feildBorderColor: grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: RichText(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: 'Gender',
                          style:
                              textStyle(black, 15, FontWeight.bold, 'Poppins'),
                          children: [
                            TextSpan(
                              text: " *",
                              style: textStyle(
                                  red, 14, FontWeight.w600, 'NunitoSans'),
                            ),
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderContainer(
                        label: 'Male',
                        active: gender == 'male',
                        onTap: () {
                          setState(() {
                            gender = 'male';
                          });
                        },
                      ),
                      GenderContainer(
                        label: 'Female',
                        active: gender == 'female',
                        onTap: () {
                          setState(() {
                            gender = 'female';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
                heigth: 50,
                width: MediaQuery.of(context).size.width * .9,
                label: 'Registor',
                color: blue1,
                loading: registor,
                onTap: () async {
                  if (_detailKey.currentState!.validate()) {
                    setState(() {
                      registor = true;
                    });
                    await registerUser(context, nameController.text, gender);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LocationAccess();
                    }));
                    setState(() {
                      registor = false;
                    });
                  }
                }),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
