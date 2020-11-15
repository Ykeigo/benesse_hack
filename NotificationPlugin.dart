import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show File, Platform;
import 'package:rxdart/subjects.dart';

class NotificationPlugin{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  BehaviorSubject<ReceivedNotification> didReceivedLocalNotificationSubject
  = BehaviorSubject<ReceivedNotification>();
  var initializationSettings;

  NotificationPlugin._(){
    init();
  }
  init () async{
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isIOS){
      _requestIOSPermission();
    }

  }
  initializePlatformSpecifics(){
    var initializationSettingsAndroid = AndroidInitializationSettings("images/ic_launcher.png");//('mipmap/ic_launcher');//('app_icon');//
    var initializationSettingIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: false,//音はほしい

        onDidReceiveLocalNotification: (id, title, body, payload) async{
          ReceivedNotification receivedNotification = ReceivedNotification(id: id, title: title, body: body, payload: payload);
          didReceivedLocalNotificationSubject.add(receivedNotification);
        },
      );
    initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload){

    });
  }

  _requestIOSPermission(){
    flutterLocalNotificationsPlugin.
    resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
      alert: false,
      badge: true,
      sound: true,
    );
  }

  setListenerForLowerVersoins(Function onNotificationInLowerVersions){
    didReceivedLocalNotificationSubject.listen((receivedNotification) {
      onNotificationInLowerVersions(receivedNotification);
    });
  }

  setOnNotificationClick(Function onNotificationClick){
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async{
      onNotificationClick(payload);
    });
  }

  Future<void> showNotification() async {
    var androidChannelSpecifics = AndroidNotificationDetails(
        'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION');
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android: androidChannelSpecifics, iOS:iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'Test Title', 'Test Body', platformChannelSpecifics, payload: 'Test Payload');

    print("notified");
  }
}

NotificationPlugin notificationPlugin = NotificationPlugin._();

class ReceivedNotification{
  int id;
  String title;
  String body;
  String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}