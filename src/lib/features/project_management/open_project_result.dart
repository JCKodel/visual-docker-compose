import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'project.dart';

part 'open_project_result.mapper.dart';

sealed class OpenProjectResult {
  const OpenProjectResult();
}

@MappableClass()
final class OpenProjectSuccessResult extends OpenProjectResult
    with OpenProjectSuccessResultMappable {
  const OpenProjectSuccessResult(this.project);

  final Project project;
}

@MappableClass()
final class OpenProjectInvalidYamlResult extends OpenProjectResult
    with OpenProjectInvalidYamlResultMappable {
  const OpenProjectInvalidYamlResult({
    required this.errorLine,
    required this.yamlLines,
  });

  final int errorLine;
  final IList<String> yamlLines;
}

@MappableClass()
final class OpenProjectUnknownErrorResult extends OpenProjectResult
    with OpenProjectUnknownErrorResultMappable {
  const OpenProjectUnknownErrorResult({
    required this.exceptionName,
    required this.exceptionMessage,
  });

  final String exceptionName;
  final String exceptionMessage;
}
