import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rideapp/utils/meta.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final bool loading;
  final String? label;
  final double? heigth;
  final double? width;
  final Color? color;
  const CustomButton(
      {Key? key,
      this.heigth,
      this.width,
      this.label,
      this.onTap,
      this.color,
      this.loading = false})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heigth ?? 50,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
            primary: widget.color!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: Center(
          child: widget.loading
              ? const Center(
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballScaleMultiple,
                        colors: [shade1, shade2],
                        pathBackgroundColor: Colors.white,
                      )),
                )
              : Text(
                  widget.label!,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: lato, fontSize: 17),
                ),
        ),
      ),
    );
  }
}
