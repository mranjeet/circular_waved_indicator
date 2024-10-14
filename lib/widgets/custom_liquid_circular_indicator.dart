import 'package:flutter/material.dart';
import 'package:waved_progress_indicator/painter/liquidpainter.dart';

class CustomLiquidCircularIndicator extends StatefulWidget {
  final double percentage;
  final Color backgroundColor;
  final Color liquidColor;
  final Color borderColor;
  final double borderWidth;
  final Widget? centerWidget;
  final bool withAnimation;

  const CustomLiquidCircularIndicator({
    super.key,
    required this.percentage,
    this.liquidColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderWidth = 5.0,
    this.centerWidget,
    this.withAnimation = true, // Control whether animation is active or not
  });

  @override
  _CustomLiquidCircularIndicatorState createState() =>
      _CustomLiquidCircularIndicatorState();
}

class _CustomLiquidCircularIndicatorState
    extends State<CustomLiquidCircularIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    if (widget.withAnimation) {
      _animationController.repeat(); // Loop animation if enabled
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ClipOval(
            // Clip the liquid fill within a circular boundary
            child: CustomPaint(
              painter: LiquidPainter(
                liquidColor: widget.liquidColor,
                percentage: widget.percentage,
                animation: widget.withAnimation
                    ? _animationController
                    : const AlwaysStoppedAnimation(0),
                backgroundColor: widget.backgroundColor,
                borderColor: widget.borderColor,
                borderWidth: widget.borderWidth,
              ),
            ),
          ),
        ),
        if (widget.centerWidget != null) widget.centerWidget!,
      ],
    );
  }
}
