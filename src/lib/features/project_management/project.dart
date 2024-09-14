import 'package:dart_mappable/dart_mappable.dart';

part 'project.mapper.dart';

@MappableClass()
final class Project with ProjectMappable {
  const Project({
    required this.path,
    required this.name,
    required this.fileName,
  });

  final String path;
  final String name;
  final String fileName;

  static const fromMap = ProjectMapper.fromMap;
  static const fromJson = ProjectMapper.fromJson;
}
