import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rideapp/models/onboard_slides.dart';
import 'package:rideapp/screens/auth/sign_up.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/text_style.dart';
import 'package:rideapp/widgets/on_board/slide_tile.dart';

class OnBoard extends StatefulWidget {
  static String routeName = "/onboard";
  const OnBoard({Key? key}) : super(key: key);
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  // ignore: deprecated_member_use
  List<SliderModel> mySlides = List<SliderModel>.empty();
  int slideIndex = 0;
  PageController? controller;

  @override
  void initState() {
    super.initState();

    mySlides = getSlides();
    controller = PageController();
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 30.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? lightBlue : blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff3C8CE7), Color(0xff00EAFF)])),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySlides[0].getImageAssetPath(),
                  title: mySlides[0].getTitle(),
                  desc: mySlides[0].getDesc(),
                ),
                SlideTile(
                  imagePath: mySlides[1].getImageAssetPath(),
                  title: mySlides[1].getTitle(),
                  desc: mySlides[1].getDesc(),
                ),
                SlideTile(
                  imagePath: mySlides[2].getImageAssetPath(),
                  title: mySlides[2].getTitle(),
                  desc: mySlides[2].getDesc(),
                ),
                SlideTile(
                  imagePath: mySlides[3].getImageAssetPath(),
                  title: mySlides[3].getTitle(),
                  desc: mySlides[3].getDesc(),
                )
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
                slideIndex != 3
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: () {
                            controller!.animateToPage(slideIndex + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          child: Container(
                            height: Platform.isIOS ? 55 : 50,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: lightBlue),
                            alignment: Alignment.center,
                            child: Text(
                              "Next",
                              style: textStyle3,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: Container(
                            height: Platform.isIOS ? 55 : 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: lightBlue),
                            alignment: Alignment.center,
                            child: Text(
                              "Get Started",
                              style: textStyle3,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
