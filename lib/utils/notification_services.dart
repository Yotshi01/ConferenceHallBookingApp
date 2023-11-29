import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class NotificationServices {
  void requestNotificationPermission() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted provisional permission');
    } else {
      print('User granted provisional permission');
    }
  }
}
