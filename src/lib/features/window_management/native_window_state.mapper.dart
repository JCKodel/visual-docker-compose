// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'native_window_state.dart';

class NativeWindowStateMapper extends ClassMapperBase<NativeWindowState> {
  NativeWindowStateMapper._();

  static NativeWindowStateMapper? _instance;
  static NativeWindowStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NativeWindowStateMapper._());
      MapperContainer.globals.useAll([RectMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'NativeWindowState';

  static Rect _$bounds(NativeWindowState v) => v.bounds;
  static const Field<NativeWindowState, Rect> _f$bounds =
      Field('bounds', _$bounds);
  static bool _$isMaximized(NativeWindowState v) => v.isMaximized;
  static const Field<NativeWindowState, bool> _f$isMaximized =
      Field('isMaximized', _$isMaximized);

  @override
  final MappableFields<NativeWindowState> fields = const {
    #bounds: _f$bounds,
    #isMaximized: _f$isMaximized,
  };

  static NativeWindowState _instantiate(DecodingData data) {
    return NativeWindowState(
        bounds: data.dec(_f$bounds), isMaximized: data.dec(_f$isMaximized));
  }

  @override
  final Function instantiate = _instantiate;

  static NativeWindowState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NativeWindowState>(map);
  }

  static NativeWindowState fromJson(String json) {
    return ensureInitialized().decodeJson<NativeWindowState>(json);
  }
}

mixin NativeWindowStateMappable {
  String toJson() {
    return NativeWindowStateMapper.ensureInitialized()
        .encodeJson<NativeWindowState>(this as NativeWindowState);
  }

  Map<String, dynamic> toMap() {
    return NativeWindowStateMapper.ensureInitialized()
        .encodeMap<NativeWindowState>(this as NativeWindowState);
  }

  NativeWindowStateCopyWith<NativeWindowState, NativeWindowState,
          NativeWindowState>
      get copyWith => _NativeWindowStateCopyWithImpl(
          this as NativeWindowState, $identity, $identity);
  @override
  String toString() {
    return NativeWindowStateMapper.ensureInitialized()
        .stringifyValue(this as NativeWindowState);
  }

  @override
  bool operator ==(Object other) {
    return NativeWindowStateMapper.ensureInitialized()
        .equalsValue(this as NativeWindowState, other);
  }

  @override
  int get hashCode {
    return NativeWindowStateMapper.ensureInitialized()
        .hashValue(this as NativeWindowState);
  }
}

extension NativeWindowStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NativeWindowState, $Out> {
  NativeWindowStateCopyWith<$R, NativeWindowState, $Out>
      get $asNativeWindowState =>
          $base.as((v, t, t2) => _NativeWindowStateCopyWithImpl(v, t, t2));
}

abstract class NativeWindowStateCopyWith<$R, $In extends NativeWindowState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({Rect? bounds, bool? isMaximized});
  NativeWindowStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NativeWindowStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NativeWindowState, $Out>
    implements NativeWindowStateCopyWith<$R, NativeWindowState, $Out> {
  _NativeWindowStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NativeWindowState> $mapper =
      NativeWindowStateMapper.ensureInitialized();
  @override
  $R call({Rect? bounds, bool? isMaximized}) => $apply(FieldCopyWithData({
        if (bounds != null) #bounds: bounds,
        if (isMaximized != null) #isMaximized: isMaximized
      }));
  @override
  NativeWindowState $make(CopyWithData data) => NativeWindowState(
      bounds: data.get(#bounds, or: $value.bounds),
      isMaximized: data.get(#isMaximized, or: $value.isMaximized));

  @override
  NativeWindowStateCopyWith<$R2, NativeWindowState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NativeWindowStateCopyWithImpl($value, $cast, t);
}
