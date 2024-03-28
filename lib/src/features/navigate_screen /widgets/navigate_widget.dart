import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class NavigateWidget extends StatelessWidget {
  const NavigateWidget({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: Text(
              text,
              style:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
            )),
          ),
        ),
      ),
    );
  }
}
