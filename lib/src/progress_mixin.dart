import 'dart:ui';

/// ProgressMixin
mixin ProgressMixin {
  /// draw progress path
  drawProgressPath(
      {required Canvas canvas, required Paint paint, required Size size});

  /// draw progress value
  drawProgressValue(
      {required Canvas canvas, required Paint paint, required Size size});
}
