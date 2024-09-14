import 'dart:developer';

String _getContext() {
  final frames = StackTrace.current.toString().split("\n");
  final frame = frames.elementAtOrNull(2);
  late final String moduleName;
  late final String functionName;

  if (frame != null) {
    final tokens = frame.split(" ");
    final context = tokens[tokens.length - 2].split(".");

    moduleName = context.first;

    final fn = context.elementAtOrNull(1);

    functionName = fn == null ? "" : ".${fn}";
  } else {
    moduleName = functionName = "";
  }

  final hash = moduleName.hashCode;
  final colorCode = (hash % 7) + 31;

  return "\x1B[${colorCode}m${moduleName}\x1B[0m${functionName}";
}

void logInfo(String text) {
  final context = _getContext();

  log("\x1B[37m${text}\x1B[0m", name: context);
}

void logError(Object exception, StackTrace stackTrace, [String text = ""]) {
  final context = _getContext();

  final message =
      text.isEmpty ? "${exception.runtimeType} (${exception})" : text;

  log(
    "\x1B[41m ${message} \x1B[0m",
    error: text.isEmpty ? null : exception,
    stackTrace: stackTrace,
    name: context,
  );
}
