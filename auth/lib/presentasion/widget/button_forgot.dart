import 'package:utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonForgot extends StatefulWidget {
  final Function onTap;
  final Function onAnimatinoEnd;
  final double elementsOpacity;

  const ButtonForgot({
    super.key,
    required this.elementsOpacity,
    required this.onAnimatinoEnd,
    required this.onTap,
  });

  @override
  State<ButtonForgot> createState() => _ButtonForgotState();
}

class _ButtonForgotState extends State<ButtonForgot> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1, end: widget.elementsOpacity),
      onEnd: () async {
        widget.onAnimatinoEnd();
      },
      builder: (_, value, __) => GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Opacity(
          opacity: value,
          child: Container(
            width: 230,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kButtonColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Kirim Verifikasi Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
