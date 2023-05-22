import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:spaced_repetition/SmResponse.dart';
import 'package:spaced_repetition/sm.dart';

class Sm2Service {
  final LoggerService _loggerService = locator<LoggerService>();
  final Sm sm = Sm();

  final String header = '[sm2_service]';

  SmResponse calculateIRE(int quality, int repetitions, int previousInterval,
      double previousEaseFactor) {
    _loggerService.printInfo(header, 'calculateIRE: calculating IRE...');
    SmResponse smResponse = sm.calc(
      quality: quality,
      repetitions: repetitions,
      previousInterval: previousInterval,
      previousEaseFactor: previousEaseFactor,
    );

    _loggerService.printInfo(header,
        'calculateIRE: interval: ${smResponse.interval} repetition: ${smResponse.repetitions} easeFactor: ${smResponse.easeFactor}');

    return smResponse;
  }
}
