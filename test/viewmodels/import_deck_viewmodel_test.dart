import 'package:flutter_test/flutter_test.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ImportDeckViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
