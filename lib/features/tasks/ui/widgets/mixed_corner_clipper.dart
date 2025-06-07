import 'package:flutter/material.dart';

class MixedCornerClip extends CustomClipper<Path> {
  final double radius;
  final double shiftAmount;

  MixedCornerClip({this.radius = 30.0, this.shiftAmount = 25.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // Line to just before top-right corner (shifted left by shiftAmount)
    path.lineTo(size.width - radius - shiftAmount, 0);

    // INWARD curve at top-right (shifted left by shiftAmount)
    path.arcToPoint(
      Offset(size.width - shiftAmount, radius),
      radius: Radius.circular(radius),
    );

    // Line to just before bottom-right corner (no shift here)
    path.lineTo(size.width - shiftAmount, size.height - radius);

    // OUTWARD curve at bottom-right (extends outside the container)
    path.arcToPoint(
      Offset(size.width - shiftAmount + radius, size.height), // Extends right
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Line to bottom-left
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper is MixedCornerClip &&
        (oldClipper.radius != radius || oldClipper.shiftAmount != shiftAmount);
  }
}
