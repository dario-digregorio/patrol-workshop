import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_challenge/main.dart';
import 'package:patrol_challenge/pages/quiz/form_page.dart';
import 'package:patrol_challenge/ui/components/button/elevated_button.dart';
import 'package:patrol_challenge/ui/style/colors.dart';

void main() {
  patrolTest(
    'test Google Sign in',
    ($) async {
      await initApp();
      await $.pumpWidgetAndSettle(const MyApp());

      if (await $.native.isPermissionDialogVisible()) {
        await $.native.grantPermissionWhenInUse();
      }

      await $('Go to the quiz').tap();
      await $('Start').tap();

      await $(TextField).enterText('test123');
      await $('Ready').scrollTo();
      await $(SelectableBox)
          .which<SelectableBox>((widget) => widget.color == PTColors.lcWhite)
          .tap();
      await $(SelectableBox)
          .which<SelectableBox>((widget) => widget.color == PTColors.lcYellow)
          .tap();
      await $(SelectableBox)
          .which<SelectableBox>((widget) => widget.color == PTColors.lcBlack)
          .tap();
      await $(ElevatedButton).scrollTo(
        view: $(Icons.arrow_right_alt),
        scrollDirection: AxisDirection.left,
        step: 2000,
      );
      await $(ElevatedButton).$(Center).$('Fluttercon').tap();
      await $(ListTile).containing(Icon).$(ElevatedButton).tap();
      final b = $(PTElevatedButton)
          .which<PTElevatedButton>((widget) => widget.onPressed != null)
          .at(2);
      await $(b).scrollTo(
        view: $(ElevatedButton),
        scrollDirection: AxisDirection.down,
        step: 2000,
      );
      await b.tap();
      if (await $.native.isPermissionDialogVisible()) {
        await $.native.grantPermissionWhenInUse();
      }
      await $.native.openNotifications();
      await $.native.tapOnNotificationBySelector(
          Selector(textContains: 'Tap me to finish'));
      await $('Start again').waitUntilVisible();
    },
  );
}
