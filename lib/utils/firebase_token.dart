import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // throw Exception(
        //     'Message also contained a notification: ${message.notification}');
      }
    });
    // Get the token
    await getToken();
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    // print('Ashok Token: $token');
    currentUserNotificationFirebaseToken = token;
    return token;
  }

  void isTokenRefresh() async {
    _fcm.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
