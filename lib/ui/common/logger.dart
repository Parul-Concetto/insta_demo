import 'package:logger/logger.dart';

class AppLogger {
  static Logger getLogger() => Logger(printer: PrettyPrinter());

  static Logger getLoggerNoStack() =>
      Logger(printer: PrettyPrinter(methodCount: 0));
}
