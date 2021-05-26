import 'package:ai_progress/src/progress_mixin.dart';
import 'package:flutter/material.dart';

/// AirStepStateProgressIndicator
// ignore: must_be_immutable
class AirStepStateProgressIndicator extends StatefulWidget {
  /// Limited
  static const int LIMITED_STEP_MIN_VALUE = 0;

  /// Default values
  static const int DEFAULT_STEP_COUNT = 10;
  static const int DEFAULT_STEP_VALUE = 1;
  static const double DEFAULT_STROKE_WIDTH = 5.0;
  static const double DEFAULT_SPACE_WIDTH = 2.0;

  final Size size;
  final int stepCount;
  final int stepValue;

  double? _pathStrokeWidth;
  double? _valueStrokeWidth;
  double? _spaceWidth;

  Color? _pathColor;
  Color? _valueColor;

  /// constructor
  AirStepStateProgressIndicator({
    required this.size,
    this.stepCount = DEFAULT_STEP_COUNT,
    this.stepValue = DEFAULT_STEP_VALUE,
    double pathStrokeWidth = DEFAULT_STROKE_WIDTH,
    double valueStrokeWidth = DEFAULT_STROKE_WIDTH,
    double spaceWidth = DEFAULT_SPACE_WIDTH,
    Color pathColor = Colors.grey,
    Color valueColor = Colors.green,
  }) {
    assert(stepCount > LIMITED_STEP_MIN_VALUE);
    assert(stepValue >= LIMITED_STEP_MIN_VALUE);
    assert(stepValue <= stepCount);

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
        roundCap: false,
      ),
    );
  }
}

/// StepProgressPainter
class StepProgressPainter extends CustomPainter with ProgressMixin {
  bool? _shouldRepaint;
  int? _stepCount;
  int? _stepValue;

  double? _pathStrokeWidth;
  double? _valueStrokeWidth;

  double? _spaceWidth;

  Color? _valueColor;
  Color? _pathColor;

  bool? _roundCap;

  /// constructor
  StepProgressPainter._({
    required bool shouldRepaint,
    required int stepCount,
    required int stepValue,
    double? pathStrokeWidth,
    double? valueStrokeWidth,
    double? spaceWidth,
    Color? pathColor,
    Color? valueColor,
    bool? roundCap,
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
    _roundCap = roundCap;

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
    return _shouldRepaint!;
  }

  @override
  drawProgressPath(
      {required Canvas canvas, required Paint paint, required Size size}) {
    //draw step progress path
    _drawStep(canvas: canvas, paint: paint, size: size, loopCount: stepCount);
  }

  @override
  drawProgressValue(
      {required Canvas canvas, required Paint paint, required Size size}) {
    //draw step progress value
    _drawStep(canvas: canvas, paint: paint, size: size, loopCount: stepValue);
  }

  _drawStep(
      {required Canvas canvas,
      required Paint paint,
      required Size size,
      required int loopCount}) {
    double y = size.height / 2;

    double startY = y;
    double endY = y;
    for (int i = 0; i < loopCount; i++) {
      double startX =
          i * (_getSingleStepWidth(size: size) + _getSingleSpaceWidth());
      double endX = startX + _getSingleStepWidth(size: size);

      Offset startPoint = Offset(startX, startY);
      Offset endPoint = Offset(endX, endY);
      //draw
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  Paint _getDrawPathPaint() {
    return Paint()
      ..color = pathColor
      ..style = PaintingStyle.stroke
      ..strokeCap = _roundCap! ? StrokeCap.butt : StrokeCap.butt
      ..strokeJoin = _roundCap! ? StrokeJoin.miter : StrokeJoin.miter
      ..strokeWidth = pathStrokeWidth;
  }

  Paint _getDrawValuePaint() {
    return Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeCap = _roundCap! ? StrokeCap.butt : StrokeCap.butt
      ..strokeJoin = _roundCap! ? StrokeJoin.miter : StrokeJoin.miter
      ..strokeWidth = valueStrokeWidth;
  }

  int get stepCount => _stepCount!;

  int get stepValue => _stepValue!;

  Color get valueColor => _valueColor!;
  Color get pathColor => _pathColor!;

  double get pathStrokeWidth => _pathStrokeWidth!;
  double get valueStrokeWidth => _valueStrokeWidth!;

  double _getSingleStepWidth({required Size size}) {
    return (size.width - ((stepCount - 1) * _getSingleSpaceWidth())) /
        stepCount;
  }

  double _getSingleSpaceWidth() {
    return _spaceWidth!;
  }
}
