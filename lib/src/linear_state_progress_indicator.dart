import 'package:ai_progress/src/progress_mixin.dart';
import 'package:flutter/material.dart';

/// LinearStateProgressIndicator
///
// ignore: must_be_immutable
class AirLinearStateProgressIndicator extends StatefulWidget {
  double _value;
  double _min;
  double _max;
  Size _size;
  bool _shouldRepaint;
  bool _roundCap;
  Color _pathColor;
  Color _valueColor;
  double _pathStrokeWidth = 5;
  double _valueStrokeWidth = 5;

  /// constructor
  AirLinearStateProgressIndicator({
    @required Size size,
    double min = 0.0,
    double max = 100.0,
    double value = 10,
    Color pathColor = Colors.white,
    Color valueColor = Colors.green,
    bool roundCap = true,
    bool shouldRepaint = false,
    double pathStrokeWidth,
    double valueStrokeWidth,
  }) {
    _size = size;
    _min = min;
    _max = max;
    _value = value;
    //style
    _roundCap = roundCap;
    //should repaint
    _shouldRepaint = shouldRepaint;
    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
    //stroke width
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;
  }
  @override
  State<StatefulWidget> createState() {
    return _LinearStateProgressIndicatorState();
  }
}

/// _LinearStateProgressIndicatorState
class _LinearStateProgressIndicatorState
    extends State<AirLinearStateProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget._size,
      painter: LinearProgressPainter._(
        shouldRepaint: widget._shouldRepaint,
        roundCap: widget._roundCap,
        min: widget._min,
        max: widget._max,
        value: widget._value,
        pathColor: widget._pathColor,
        valueColor: widget._valueColor,
        pathStrokeWidth: widget._pathStrokeWidth,
        valueStrokeWidth: widget._valueStrokeWidth,
      ),
    );
  }
}

/// LinearProgressPainter
class LinearProgressPainter extends CustomPainter with ProgressMixin {
  bool _shouldRepaint;
  bool _roundCap;
  double _min;
  double _max;
  double _value;

  Color _pathColor;
  Color _valueColor;

  double _pathStrokeWidth;
  double _valueStrokeWidth;

  /// constructor
  LinearProgressPainter._({
    @required bool shouldRepaint,
    @required bool roundCap,
    @required double min,
    @required double max,
    @required double value,
    @required Color pathColor,
    @required Color valueColor,
    @required double pathStrokeWidth,
    @required double valueStrokeWidth,
  }) {
    //should repaint
    _shouldRepaint = shouldRepaint;
    //round style
    _roundCap = roundCap;
    _min = min;
    _max = max;
    _value = value;
    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
    //stroke width
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;
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
    double heightCenter = size.height / 2;
    double widthCenter = size.width / 2;
    double width = size.width;

    Offset startPoint = Offset(0, heightCenter);
    Offset endPoint = Offset(width, heightCenter);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  drawProgressValue({Canvas canvas, Paint paint, Size size}) {
    double heightCenter = size.height / 2;
    double widthCenter = size.width / 2;
    double width = size.width;

    Offset startPoint = Offset(0, heightCenter);
    Offset endPoint = Offset(_getDrawWidthValue(size: size), heightCenter);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  Paint _getDrawPathPaint() {
    return Paint()
      ..color = _pathColor
      ..strokeWidth = _pathStrokeWidth
      ..strokeCap = _roundCap ? StrokeCap.round : StrokeCap.square;
  }

  Paint _getDrawValuePaint() {
    return Paint()
      ..color = _valueColor
      ..strokeWidth = _valueStrokeWidth
      ..strokeCap = _roundCap ? StrokeCap.round : StrokeCap.square;
  }

  double _getDrawWidthValue({@required Size size}) {
    double drawWidthValue = size.width * (_value / _max);

    //range size
    drawWidthValue = drawWidthValue < 0 ? 0 : drawWidthValue;
    drawWidthValue = drawWidthValue > size.width ? size.width : drawWidthValue;
    return drawWidthValue;
  }
}
