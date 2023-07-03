import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fyp_ezymemory/app/app.bottomsheets.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/ui/common/app_strings.dart';
import 'package:fyp_ezymemory/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final bottomSheetService = getAndRegisterBottomSheetService();

        final model = _getModel();
        model.showBottomSheet();
        verify(bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: ksHomeBottomSheetTitle,
          description: ksHomeBottomSheetDescription,
        ));
      });
    });
  });
}
