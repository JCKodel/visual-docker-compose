part of 'window_manager.dart';

@MappableClass(includeCustomMappers: [RectMapper()])
final class WindowState with WindowStateMappable {
  const WindowState({
    required this.bounds,
    required this.isMaximized,
  });

  final Rect bounds;

  final bool isMaximized;

  static const fromMap = WindowStateMapper.fromMap;
  static const fromJson = WindowStateMapper.fromJson;
}

final class RectMapper extends SimpleMapper<Rect> {
  const RectMapper();

  @override
  Rect decode(Object value) {
    if (value
        case {
          "left": final double left,
          "top": final double top,
          "width": final double width,
          "height": final double height
        }) {
      return Rect.fromLTWH(left, top, width, height);
    }

    throw const FormatException("Invalid Rect format");
  }

  @override
  Object? encode(Rect self) {
    return {
      "left": self.left,
      "top": self.top,
      "width": self.width,
      "height": self.height,
    };
  }
}
