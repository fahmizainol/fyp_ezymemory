import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';

class PointService {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final header = ['point_service'];

  Future addPoints(int activity, double points) async {
    // double points = 0;
    switch (activity) {
      case 0:
        _loggerService.printInfo(header, "addPoints: Sign In");
        // points = 200;
        break;
      case 1:
        _loggerService.printInfo(header, "addPoints: Flashcard finished");
        // points = 400;
        break;
      case 2:
        _loggerService.printInfo(header, "addPoints: Memory game finished");
        // points = 600;
        break;
      default:
        points = 0;
    }
    _firestoreService.updatePoints(points);
  }
}
