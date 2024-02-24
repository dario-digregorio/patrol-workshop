import 'package:patrol/patrol.dart';
import 'package:patrol_challenge/main.dart';

void main() {
  patrolTest(
    'test Notification',
    ($) async {
      await initApp();
      await $.pumpWidgetAndSettle(const MyApp());

      await $('Send notification').tap();
      if (await $.native.isPermissionDialogVisible()) {
        await $.native.grantPermissionWhenInUse();
      }
      // await $.native.tap(Selector(textContains: 'info@dario-digregorio.de'));
    },
  );
}
