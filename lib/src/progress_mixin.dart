import 'dart:ui';

/// ProgressMixin
mixin ProgressMixin {
  /// draw progress path
  drawProgressPath({Canvas canvas, Paint paint, Size size});

  /// draw progress value
  drawProgressValue({Canvas canvas, Paint paint, Size size});
}
