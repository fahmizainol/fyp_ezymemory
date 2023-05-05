import 'package:simple_logger/simple_logger.dart';

// Singleton (factory)

class LoggerService {
  final logger = SimpleLogger();

  void setLoggerLevel() {
    logger.setLevel(
      Level.INFO,
      // Includes  caller info, but this is expensive.
      includeCallerInfo: true,
    );
  }

  void printInfo(header, message) {
    logger.formatter = (info) => '👻 $header ${info.message}';
    logger.info(message);
  }

  void printWarning(message) {
    logger.warning(message);
  }

  void printShout(message) {
    logger.shout(message);
  }
}
