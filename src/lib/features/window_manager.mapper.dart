// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'window_manager.dart';

class WindowStateMapper extends ClassMapperBase<WindowState> {
  WindowStateMapper._();

  static WindowStateMapper? _instance;
  static WindowStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WindowStateMapper._());
      MapperContainer.globals.useAll([RectMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'WindowState';

  static Rect _$bounds(WindowState v) => v.bounds;
  static const Field<WindowState, Rect> _f$bounds = Field('bounds', _$bounds);
  static bool _$isMaximized(WindowState v) => v.isMaximized;
  static const Field<WindowState, bool> _f$isMaximized =
      Field('isMaximized', _$isMaximized);

  @override
  final MappableFields<WindowState> fields = const {
    #bounds: _f$bounds,
    #isMaximized: _f$isMaximized,
  };

  static WindowState _instantiate(DecodingData data) {
    return WindowState(
        bounds: data.dec(_f$bounds), isMaximized: data.dec(_f$isMaximized));
  }

  @override
  final Function instantiate = _instantiate;

  static WindowState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WindowState>(map);
  }

  static WindowState fromJson(String json) {
    return ensureInitialized().decodeJson<WindowState>(json);
  }
}

mixin WindowStateMappable {
  String toJson() {
    return WindowStateMapper.ensureInitialized()
        .encodeJson<WindowState>(this as WindowState);
  }

  Map<String, dynamic> toMap() {
    return WindowStateMapper.ensureInitialized()
        .encodeMap<WindowState>(this as WindowState);
  }

  WindowStateCopyWith<WindowState, WindowState, WindowState> get copyWith =>
      _WindowStateCopyWithImpl(this as WindowState, $identity, $identity);
  @override
  String toString() {
    return WindowStateMapper.ensureInitialized()
        .stringifyValue(this as WindowState);
  }

  @override
  bool operator ==(Object other) {
    return WindowStateMapper.ensureInitialized()
        .equalsValue(this as WindowState, other);
  }

  @override
  int get hashCode {
    return WindowStateMapper.ensureInitialized().hashValue(this as WindowState);
  }
}

extension WindowStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WindowState, $Out> {
  WindowStateCopyWith<$R, WindowState, $Out> get $asWindowState =>
      $base.as((v, t, t2) => _WindowStateCopyWithImpl(v, t, t2));
}

abstract class WindowStateCopyWith<$R, $In extends WindowState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Rect? bounds, bool? isMaximized});
  WindowStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WindowStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WindowState, $Out>
    implements WindowStateCopyWith<$R, WindowState, $Out> {
  _WindowStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WindowState> $mapper =
      WindowStateMapper.ensureInitialized();
  @override
  $R call({Rect? bounds, bool? isMaximized}) => $apply(FieldCopyWithData({
        if (bounds != null) #bounds: bounds,
        if (isMaximized != null) #isMaximized: isMaximized
      }));
  @override
  WindowState $make(CopyWithData data) => WindowState(
      bounds: data.get(#bounds, or: $value.bounds),
      isMaximized: data.get(#isMaximized, or: $value.isMaximized));

  @override
  WindowStateCopyWith<$R2, WindowState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WindowStateCopyWithImpl($value, $cast, t);
}
