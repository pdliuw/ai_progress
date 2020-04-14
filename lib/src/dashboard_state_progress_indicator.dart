import 'package:flutter/material.dart';

import 'progress_mixin.dart';

///
const double LIMITED_MIN_VALUE = 0;
const double LIMITED_MAX_VALUE = 100;
const double DEFAULT_VALUE = 10;

/// Gap degree limited min and max value
const int LIMITED_MIN_GAP_DEGREE = 0;
const int LIMITED_MAX_GAP_DEGREE = 360;
const int DEFAULT_GAP_DEGREE = 60;
const int UNIT_GAP_DEGREE = 60;

const double DEFAULT_STROKE_WIDTH = 5;

/// DashboardStateProgressIndicator
// ignore: must_be_immutable
class AirDashboardStateProgressIndicator extends StatefulWidget {
  Size _size;
  double _min;
  double _max;
  num _value;
  Color _pathColor;
  Color _valueColor;
  double _pathStrokeWidth;
  double _valueStrokeWidth;
  bool _filled;
  bool _useCenter;
  bool _roundCap;

  double _gapDegree;

  /// constructor
  AirDashboardStateProgressIndicator({
    Size size,
    double min = LIMITED_MIN_VALUE,
    double max = LIMITED_MAX_VALUE,
    num value = DEFAULT_VALUE,
    int gapDegree = DEFAULT_GAP_DEGREE,
    Color pathColor = Colors.white,
    Color valueColor = Colors.green,
    double pathStrokeWidth = DEFAULT_STROKE_WIDTH,
    double valueStrokeWidth = DEFAULT_STROKE_WIDTH,
    bool filled = false,
    bool useCenter = false,
    bool roundCap = true,
  }) {
    assert(size != null);
    assert(min >= LIMITED_MIN_VALUE);
    assert(max <= LIMITED_MAX_VALUE);
    assert(value >= min);
    assert(value <= max);
    assert(gapDegree >= LIMITED_MIN_GAP_DEGREE);
    assert(gapDegree <= LIMITED_MAX_GAP_DEGREE);
    assert(pathColor != null);
    assert(valueColor != null);
    assert(pathStrokeWidth != null);
    assert(valueStrokeWidth != null);
    assert(filled != null);
    assert(useCenter != null);
    assert(roundCap != null);
    _size = size;
    //value >= 0.00,value<=100
    _value = value;
    _gapDegree = gapDegree / UNIT_GAP_DEGREE;
    _min = min;
    _max = max;
    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
    //stroke width
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;

    //paint round cap
    _roundCap = roundCap;
    //
    _filled = filled;
    _useCenter = useCenter;

    //The strokeWidth is zero when _filled is true,
    if (_filled) {
      _pathStrokeWidth = 0.0;
      _valueStrokeWidth = 0.0;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _DashboardStateProgressIndicatorState();
  }
}

/// _DashboardStateProgressIndicatorState
class _DashboardStateProgressIndicatorState
    extends State<AirDashboardStateProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget._size,
      painter: DashboardProgressPaint._(
        shouldRepaint: false,
        division: LIMITED_MAX_GAP_DEGREE ~/ UNIT_GAP_DEGREE,
        min: widget._min,
        max: widget._max,
        value: widget._value,
        gapDegree: widget._gapDegree,
        pathPaint: _getPathPaint(),
        valuePaint: _getValuePaint(),
        useCenter: widget._useCenter,
      ),
    );
  }

  Paint _getPathPaint() {
    return Paint()
      ..color = widget._pathColor
      ..strokeWidth = widget._pathStrokeWidth
      ..strokeCap = widget._roundCap ? StrokeCap.round : StrokeCap.square
      ..strokeJoin = widget._roundCap ? StrokeJoin.round : StrokeJoin.bevel
      ..style = widget._filled ? PaintingStyle.fill : PaintingStyle.stroke;
  }

  Paint _getValuePaint() {
    return Paint()
      ..color = widget._valueColor
      ..strokeWidth = widget._valueStrokeWidth
      ..strokeCap = widget._roundCap ? StrokeCap.round : StrokeCap.square
      ..strokeJoin = widget._roundCap ? StrokeJoin.round : StrokeJoin.bevel
      ..style = widget._filled ? PaintingStyle.fill : PaintingStyle.stroke;
  }
}

/// DashboardProgressPaint
class DashboardProgressPaint extends CustomPainter with ProgressMixin {
  static const int GAP_DEGREE_DIVISION = 6;
  static const PI = 3.1415926;
  final num maxSweepAngle = 6.5;
  final num circleMaxSweepAngle = 6.1275;
  final num minSweepAngle = 1.0;
  bool _shouldRepaint;
  num _min;
  num _max;
  num _value;
  Paint _pathPaint;
  Paint _valuePaint;
  bool _useCenter;
  double _gapDegree;
  int _division;

  /// CircularProgressPaint
  ///
  DashboardProgressPaint._({
    @required bool shouldRepaint,
    @required int division,
    @required num min,
    @required num max,
    @required num value,
    @required double gapDegree,
    @required Paint pathPaint,
    @required Paint valuePaint,
    @required bool useCenter,
  }) {
    _shouldRepaint = shouldRepaint;
    _division = division;
    _min = min;
    _max = max;
    _value = value;
    _gapDegree = gapDegree;
    _pathPaint = pathPaint;
    _valuePaint = valuePaint;
    _useCenter = useCenter;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // draw progress path
    drawProgressPath(canvas: canvas, paint: _pathPaint, size: size);

    // draw progress value
    drawProgressValue(canvas: canvas, paint: _valuePaint, size: size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return _shouldRepaint;
  }

  @override
  drawProgressPath({Canvas canvas, Paint paint, Size size}) {
    Offset center = _getOffset(size: size);
    double radius = _getRadius(size: size);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        _getStartAngle(), _getMaxSweepAngle(), useCenter, paint);
  }

  @override
  drawProgressValue({Canvas canvas, Paint paint, Size size}) {
    Offset center = _getOffset(size: size);
    double radius = _getRadius(size: size);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        _getStartAngle(), _getValueSweepAngle(), useCenter, paint);
  }

  double get gapDegree => _gapDegree;
  int get division => _division;

  double _getCircleMaxAngle() {
    return circleMaxSweepAngle;
  }

  double _getStartAngle() {
    return _getGapDegreeSweepAngle() / 2 + maxSweepAngle / 4;
  }

  double _getGapDegreeSweepAngle() {
    return (maxSweepAngle / division) * _gapDegree;
  }

  double _getMaxSweepAngle() {
    return _getCircleMaxAngle() - _getGapDegreeSweepAngle();
  }

  double _getValueSweepAngle() {
    return _getMaxSweepAngle() / _max * _value;
  }

  /// useCenter
  /// whether use center point close the path.
  bool get useCenter {
    return _useCenter;
  }

  double _getRadius({Size size}) {
    double radius =
        size.width / 2 < size.height / 2 ? size.width / 2 : size.height / 2;
    radius -= _valuePaint.strokeWidth / 2;
    return radius;
  }

  Offset _getOffset({Size size}) {
    return Offset(size.width / 2, size.height / 2);
  }
}
