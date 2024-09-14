// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'open_project_result.dart';

class OpenProjectSuccessResultMapper
    extends ClassMapperBase<OpenProjectSuccessResult> {
  OpenProjectSuccessResultMapper._();

  static OpenProjectSuccessResultMapper? _instance;
  static OpenProjectSuccessResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OpenProjectSuccessResultMapper._());
      ProjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OpenProjectSuccessResult';

  static Project _$project(OpenProjectSuccessResult v) => v.project;
  static const Field<OpenProjectSuccessResult, Project> _f$project =
      Field('project', _$project);

  @override
  final MappableFields<OpenProjectSuccessResult> fields = const {
    #project: _f$project,
  };

  static OpenProjectSuccessResult _instantiate(DecodingData data) {
    return OpenProjectSuccessResult(data.dec(_f$project));
  }

  @override
  final Function instantiate = _instantiate;

  static OpenProjectSuccessResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpenProjectSuccessResult>(map);
  }

  static OpenProjectSuccessResult fromJson(String json) {
    return ensureInitialized().decodeJson<OpenProjectSuccessResult>(json);
  }
}

mixin OpenProjectSuccessResultMappable {
  String toJson() {
    return OpenProjectSuccessResultMapper.ensureInitialized()
        .encodeJson<OpenProjectSuccessResult>(this as OpenProjectSuccessResult);
  }

  Map<String, dynamic> toMap() {
    return OpenProjectSuccessResultMapper.ensureInitialized()
        .encodeMap<OpenProjectSuccessResult>(this as OpenProjectSuccessResult);
  }

  OpenProjectSuccessResultCopyWith<OpenProjectSuccessResult,
          OpenProjectSuccessResult, OpenProjectSuccessResult>
      get copyWith => _OpenProjectSuccessResultCopyWithImpl(
          this as OpenProjectSuccessResult, $identity, $identity);
  @override
  String toString() {
    return OpenProjectSuccessResultMapper.ensureInitialized()
        .stringifyValue(this as OpenProjectSuccessResult);
  }

  @override
  bool operator ==(Object other) {
    return OpenProjectSuccessResultMapper.ensureInitialized()
        .equalsValue(this as OpenProjectSuccessResult, other);
  }

  @override
  int get hashCode {
    return OpenProjectSuccessResultMapper.ensureInitialized()
        .hashValue(this as OpenProjectSuccessResult);
  }
}

extension OpenProjectSuccessResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OpenProjectSuccessResult, $Out> {
  OpenProjectSuccessResultCopyWith<$R, OpenProjectSuccessResult, $Out>
      get $asOpenProjectSuccessResult => $base
          .as((v, t, t2) => _OpenProjectSuccessResultCopyWithImpl(v, t, t2));
}

abstract class OpenProjectSuccessResultCopyWith<
    $R,
    $In extends OpenProjectSuccessResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ProjectCopyWith<$R, Project, Project> get project;
  $R call({Project? project});
  OpenProjectSuccessResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OpenProjectSuccessResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OpenProjectSuccessResult, $Out>
    implements
        OpenProjectSuccessResultCopyWith<$R, OpenProjectSuccessResult, $Out> {
  _OpenProjectSuccessResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OpenProjectSuccessResult> $mapper =
      OpenProjectSuccessResultMapper.ensureInitialized();
  @override
  ProjectCopyWith<$R, Project, Project> get project =>
      $value.project.copyWith.$chain((v) => call(project: v));
  @override
  $R call({Project? project}) =>
      $apply(FieldCopyWithData({if (project != null) #project: project}));
  @override
  OpenProjectSuccessResult $make(CopyWithData data) =>
      OpenProjectSuccessResult(data.get(#project, or: $value.project));

  @override
  OpenProjectSuccessResultCopyWith<$R2, OpenProjectSuccessResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OpenProjectSuccessResultCopyWithImpl($value, $cast, t);
}

class OpenProjectInvalidYamlResultMapper
    extends ClassMapperBase<OpenProjectInvalidYamlResult> {
  OpenProjectInvalidYamlResultMapper._();

  static OpenProjectInvalidYamlResultMapper? _instance;
  static OpenProjectInvalidYamlResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OpenProjectInvalidYamlResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OpenProjectInvalidYamlResult';

  static int _$errorLine(OpenProjectInvalidYamlResult v) => v.errorLine;
  static const Field<OpenProjectInvalidYamlResult, int> _f$errorLine =
      Field('errorLine', _$errorLine);
  static IList<String> _$yamlLines(OpenProjectInvalidYamlResult v) =>
      v.yamlLines;
  static const Field<OpenProjectInvalidYamlResult, IList<String>> _f$yamlLines =
      Field('yamlLines', _$yamlLines);

  @override
  final MappableFields<OpenProjectInvalidYamlResult> fields = const {
    #errorLine: _f$errorLine,
    #yamlLines: _f$yamlLines,
  };

  static OpenProjectInvalidYamlResult _instantiate(DecodingData data) {
    return OpenProjectInvalidYamlResult(
        errorLine: data.dec(_f$errorLine), yamlLines: data.dec(_f$yamlLines));
  }

  @override
  final Function instantiate = _instantiate;

  static OpenProjectInvalidYamlResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpenProjectInvalidYamlResult>(map);
  }

  static OpenProjectInvalidYamlResult fromJson(String json) {
    return ensureInitialized().decodeJson<OpenProjectInvalidYamlResult>(json);
  }
}

mixin OpenProjectInvalidYamlResultMappable {
  String toJson() {
    return OpenProjectInvalidYamlResultMapper.ensureInitialized()
        .encodeJson<OpenProjectInvalidYamlResult>(
            this as OpenProjectInvalidYamlResult);
  }

  Map<String, dynamic> toMap() {
    return OpenProjectInvalidYamlResultMapper.ensureInitialized()
        .encodeMap<OpenProjectInvalidYamlResult>(
            this as OpenProjectInvalidYamlResult);
  }

  OpenProjectInvalidYamlResultCopyWith<OpenProjectInvalidYamlResult,
          OpenProjectInvalidYamlResult, OpenProjectInvalidYamlResult>
      get copyWith => _OpenProjectInvalidYamlResultCopyWithImpl(
          this as OpenProjectInvalidYamlResult, $identity, $identity);
  @override
  String toString() {
    return OpenProjectInvalidYamlResultMapper.ensureInitialized()
        .stringifyValue(this as OpenProjectInvalidYamlResult);
  }

  @override
  bool operator ==(Object other) {
    return OpenProjectInvalidYamlResultMapper.ensureInitialized()
        .equalsValue(this as OpenProjectInvalidYamlResult, other);
  }

  @override
  int get hashCode {
    return OpenProjectInvalidYamlResultMapper.ensureInitialized()
        .hashValue(this as OpenProjectInvalidYamlResult);
  }
}

extension OpenProjectInvalidYamlResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OpenProjectInvalidYamlResult, $Out> {
  OpenProjectInvalidYamlResultCopyWith<$R, OpenProjectInvalidYamlResult, $Out>
      get $asOpenProjectInvalidYamlResult => $base.as(
          (v, t, t2) => _OpenProjectInvalidYamlResultCopyWithImpl(v, t, t2));
}

abstract class OpenProjectInvalidYamlResultCopyWith<
    $R,
    $In extends OpenProjectInvalidYamlResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? errorLine, IList<String>? yamlLines});
  OpenProjectInvalidYamlResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OpenProjectInvalidYamlResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OpenProjectInvalidYamlResult, $Out>
    implements
        OpenProjectInvalidYamlResultCopyWith<$R, OpenProjectInvalidYamlResult,
            $Out> {
  _OpenProjectInvalidYamlResultCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OpenProjectInvalidYamlResult> $mapper =
      OpenProjectInvalidYamlResultMapper.ensureInitialized();
  @override
  $R call({int? errorLine, IList<String>? yamlLines}) =>
      $apply(FieldCopyWithData({
        if (errorLine != null) #errorLine: errorLine,
        if (yamlLines != null) #yamlLines: yamlLines
      }));
  @override
  OpenProjectInvalidYamlResult $make(CopyWithData data) =>
      OpenProjectInvalidYamlResult(
          errorLine: data.get(#errorLine, or: $value.errorLine),
          yamlLines: data.get(#yamlLines, or: $value.yamlLines));

  @override
  OpenProjectInvalidYamlResultCopyWith<$R2, OpenProjectInvalidYamlResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OpenProjectInvalidYamlResultCopyWithImpl($value, $cast, t);
}

class OpenProjectUnknownErrorResultMapper
    extends ClassMapperBase<OpenProjectUnknownErrorResult> {
  OpenProjectUnknownErrorResultMapper._();

  static OpenProjectUnknownErrorResultMapper? _instance;
  static OpenProjectUnknownErrorResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OpenProjectUnknownErrorResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OpenProjectUnknownErrorResult';

  static String _$exceptionName(OpenProjectUnknownErrorResult v) =>
      v.exceptionName;
  static const Field<OpenProjectUnknownErrorResult, String> _f$exceptionName =
      Field('exceptionName', _$exceptionName);
  static String _$exceptionMessage(OpenProjectUnknownErrorResult v) =>
      v.exceptionMessage;
  static const Field<OpenProjectUnknownErrorResult, String>
      _f$exceptionMessage = Field('exceptionMessage', _$exceptionMessage);

  @override
  final MappableFields<OpenProjectUnknownErrorResult> fields = const {
    #exceptionName: _f$exceptionName,
    #exceptionMessage: _f$exceptionMessage,
  };

  static OpenProjectUnknownErrorResult _instantiate(DecodingData data) {
    return OpenProjectUnknownErrorResult(
        exceptionName: data.dec(_f$exceptionName),
        exceptionMessage: data.dec(_f$exceptionMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static OpenProjectUnknownErrorResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpenProjectUnknownErrorResult>(map);
  }

  static OpenProjectUnknownErrorResult fromJson(String json) {
    return ensureInitialized().decodeJson<OpenProjectUnknownErrorResult>(json);
  }
}

mixin OpenProjectUnknownErrorResultMappable {
  String toJson() {
    return OpenProjectUnknownErrorResultMapper.ensureInitialized()
        .encodeJson<OpenProjectUnknownErrorResult>(
            this as OpenProjectUnknownErrorResult);
  }

  Map<String, dynamic> toMap() {
    return OpenProjectUnknownErrorResultMapper.ensureInitialized()
        .encodeMap<OpenProjectUnknownErrorResult>(
            this as OpenProjectUnknownErrorResult);
  }

  OpenProjectUnknownErrorResultCopyWith<OpenProjectUnknownErrorResult,
          OpenProjectUnknownErrorResult, OpenProjectUnknownErrorResult>
      get copyWith => _OpenProjectUnknownErrorResultCopyWithImpl(
          this as OpenProjectUnknownErrorResult, $identity, $identity);
  @override
  String toString() {
    return OpenProjectUnknownErrorResultMapper.ensureInitialized()
        .stringifyValue(this as OpenProjectUnknownErrorResult);
  }

  @override
  bool operator ==(Object other) {
    return OpenProjectUnknownErrorResultMapper.ensureInitialized()
        .equalsValue(this as OpenProjectUnknownErrorResult, other);
  }

  @override
  int get hashCode {
    return OpenProjectUnknownErrorResultMapper.ensureInitialized()
        .hashValue(this as OpenProjectUnknownErrorResult);
  }
}

extension OpenProjectUnknownErrorResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OpenProjectUnknownErrorResult, $Out> {
  OpenProjectUnknownErrorResultCopyWith<$R, OpenProjectUnknownErrorResult, $Out>
      get $asOpenProjectUnknownErrorResult => $base.as(
          (v, t, t2) => _OpenProjectUnknownErrorResultCopyWithImpl(v, t, t2));
}

abstract class OpenProjectUnknownErrorResultCopyWith<
    $R,
    $In extends OpenProjectUnknownErrorResult,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? exceptionName, String? exceptionMessage});
  OpenProjectUnknownErrorResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OpenProjectUnknownErrorResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OpenProjectUnknownErrorResult, $Out>
    implements
        OpenProjectUnknownErrorResultCopyWith<$R, OpenProjectUnknownErrorResult,
            $Out> {
  _OpenProjectUnknownErrorResultCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OpenProjectUnknownErrorResult> $mapper =
      OpenProjectUnknownErrorResultMapper.ensureInitialized();
  @override
  $R call({String? exceptionName, String? exceptionMessage}) =>
      $apply(FieldCopyWithData({
        if (exceptionName != null) #exceptionName: exceptionName,
        if (exceptionMessage != null) #exceptionMessage: exceptionMessage
      }));
  @override
  OpenProjectUnknownErrorResult $make(CopyWithData data) =>
      OpenProjectUnknownErrorResult(
          exceptionName: data.get(#exceptionName, or: $value.exceptionName),
          exceptionMessage:
              data.get(#exceptionMessage, or: $value.exceptionMessage));

  @override
  OpenProjectUnknownErrorResultCopyWith<$R2, OpenProjectUnknownErrorResult,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OpenProjectUnknownErrorResultCopyWithImpl($value, $cast, t);
}
