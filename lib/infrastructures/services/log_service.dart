
import 'package:logger/logger.dart';

class LogService {
  static Logger? _logger;

  LogService._();

  static LogService get create {
    _logger ??= Logger(
      filter: DevelopmentFilter(),
      printer: PrettyPrinter(),
    );
    return LogService._();
  }

  static void d(String message) {
    _logger?.d(message);
  }

  static void i(String message) {
    _logger?.i(message);
  }

  static void w(String message) {
    _logger?.w(message);
  }

  static void e(String message) {
    _logger?.e(message);
  }
}
