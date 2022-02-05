import 'package:flutter/material.dart';
import 'package:rideapp/utils/fade_animation.dart';
import 'package:rideapp/utils/text_style.dart';

class SlideTile extends StatelessWidget {
  final String? imagePath, title, desc;

  const SlideTile({Key? key, this.imagePath, this.title, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            5,
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(imagePath!)),
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: textStyle1,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(desc!, textAlign: TextAlign.center, style: textStyle2)
        ],
      ),
    );
  }
}
