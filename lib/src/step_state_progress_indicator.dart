import 'package:ai_progress/src/progress_mixin.dart';
import 'package:flutter/material.dart';

/// AirStepStateProgressIndicator
// ignore: must_be_immutable
class AirStepStateProgressIndicator extends StatefulWidget {
  final Size size;
  final int stepCount;
  final int stepValue;

  double _pathStrokeWidth;
  double _valueStrokeWidth;
  double _spaceWidth;

  Color _pathColor;
  Color _valueColor;

  /// constructor
  AirStepStateProgressIndicator({
    this.size,
    this.stepCount,
    this.stepValue,
    double pathStrokeWidth = 5.0,
    double valueStrokeWidth = 5.0,
    double spaceWidth = 2.0,
    Color pathColor = Colors.grey,
    Color valueColor = Colors.green,
  }) {
    if (stepCount <= 0) {}

    //stroke width
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;

    //space
    _spaceWidth = spaceWidth;

    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
  }
  @override
  State<StatefulWidget> createState() {
    return _StepStateProgressIndicator();
  }
}

/// _StepStateProgressIndicator
class _StepStateProgressIndicator extends State<AirStepStateProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget.size,
      painter: StepProgressPainter._(
        shouldRepaint: false,
        stepCount: widget.stepCount,
        stepValue: widget.stepValue,
        pathStrokeWidth: widget._pathStrokeWidth,
        valueStrokeWidth: widget._valueStrokeWidth,
        spaceWidth: widget._spaceWidth,
        pathColor: widget._pathColor,
        valueColor: widget._valueColor,
      ),
    );
  }
}

/// StepProgressPainter
class StepProgressPainter extends CustomPainter with ProgressMixin {
  bool _shouldRepaint;
  int _stepCount;
  int _stepValue;

  double _pathStrokeWidth;
  double _valueStrokeWidth;

  double _spaceWidth;

  Color _valueColor;
  Color _pathColor;

  /// constructor
  StepProgressPainter._({
    @required bool shouldRepaint,
    @required int stepCount,
    @required int stepValue,
    double pathStrokeWidth,
    double valueStrokeWidth,
    double spaceWidth,
    Color pathColor,
    Color valueColor,
  }) {
    //should repaint
    _shouldRepaint = shouldRepaint;

    //step count
    _stepCount = stepCount;

    //step value
    _stepValue = stepValue;

    //stroke
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;

    //
    _spaceWidth = spaceWidth;

    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
  }
  @override
  void paint(Canvas canvas, Size size) {
    //draw progress path
    drawProgressPath(canvas: canvas, paint: _getDrawPathPaint(), size: size);

    //draw progress value
    drawProgressValue(canvas: canvas, paint: _getDrawValuePaint(), size: size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return _shouldRepaint;
  }

  @override
  drawProgressPath({Canvas canvas, Paint paint, Size size}) {
    //draw step progress path
    _drawStep(canvas: canvas, paint: paint, size: size, loopCount: stepCount);
  }

  @override
  drawProgressValue({Canvas canvas, Paint paint, Size size}) {
    //draw step progress value
    _drawStep(canvas: canvas, paint: paint, size: size, loopCount: stepValue);
  }

  _drawStep({Canvas canvas, Paint paint, Size size, int loopCount}) {
    double y = size.height / 2;

    double startY = y;
    double endY = y;
    for (int i = 0; i < loopCount; i++) {
      double startX = i *
          (_getSingleStepWidth(size: size) + _getSingleSpaceWidth(size: size));
      double endX = startX + _getSingleStepWidth(size: size);

      Offset startPoint = Offset(startX, startY);
      Offset endPoint = Offset(endX, endY);
      //draw
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  Paint _getDrawPathPaint() {
    return Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = pathStrokeWidth;
  }

  Paint _getDrawValuePaint() {
    return Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = valueStrokeWidth;
  }

  int get stepCount => _stepCount;

  int get stepValue => _stepValue;

  Color get valueColor => _valueColor;
  Color get pathColor => _pathColor;

  double get pathStrokeWidth => _pathStrokeWidth;
  double get valueStrokeWidth => _valueStrokeWidth;

  double _getSingleStepWidth({Size size}) {
    return (size.width - ((stepCount - 1) * _getSingleSpaceWidth())) /
        stepCount;
  }

  double _getSingleSpaceWidth({Size size}) {
    return _spaceWidth;
  }
}
