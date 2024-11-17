
import 'package:flutter/material.dart';

class DashedCircularBorderPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final int dashCounter; 
  final double startAngle;
  final double angleRange; 
  final double gapRatio;

  DashedCircularBorderPainter({
    required this.color,
    required this.thickness,
    required this.dashCounter,
    required this.startAngle,
    required this.angleRange,
    this.gapRatio = 0.5, 
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    final radius = (size.width - thickness) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Convert degrees to radians
    final double startRadian = degreesToRadians(startAngle);
    final double totRadian = degreesToRadians(angleRange);

    final double segmentAngle = totRadian / dashCounter;
    final double gapAngle = segmentAngle * gapRatio;
    final double dashAngle = segmentAngle - gapAngle;

  //This is used to change the size of the last andd first dash
    final double firstDash = dashAngle * 0.6;  
    final double lastDash = dashAngle * 0.6;   

   //for drawing the dashes in the screen
    for (int i = 0; i < dashCounter; i++) {
      final double dashStart = startRadian + (i * segmentAngle);
      double dashtoDraw = dashAngle;

      if (i == 0) {
        dashtoDraw = firstDash; 
      } else if (i == dashCounter - 1) {
        dashtoDraw = lastDash; 
      }

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        dashStart,
        dashtoDraw,
        false,
        paint,
      );
    }
  }

  double degreesToRadians(double degrees) => degrees * (3.14 / 180);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

 