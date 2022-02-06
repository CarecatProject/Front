import 'package:carecat/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/dashboard/dashboard.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await initFirebase();
  print('Handling a background message ${message.messageId}');
}

Future<void> initFirebase() async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: "CareCat",
      options: const FirebaseOptions(
        apiKey:
            'AAAABaJDZDc:APA91bFa7p40Ut8o1jokY8iO-y8vB5Nh0F5TM2OvurB15rTe3GwLtXMdNRlvufFfRi7yxwWtKmKFmnisI5IkY1c9ELXsKWcwZhAPz_Oq7LO-lHfdhgXodwf1er26cp_zT5NGcCuSWryZ',
        appId: '1:24197162039:android:313c5fabfd7c659fe2cbb2',
        messagingSenderId: '24197162039',
        projectId: 'stray-cat-340411',
      ),
    );
  } else {
    Firebase.app('CareCat'); // 이미 초기화되었다면, 초기화 된 것을 사용함
  }
}

late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await initFirebase();
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoBloc()..add(const UserInfoInit()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
          if (state is UserInfoLoaded) {
            return const DashBoard();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
