import 'package:bene_2/NotificationPlugin.dart';
import 'package:flutter/material.dart';
//import 'LocalNotificationScreen.dart';

class LocalNotificationScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LocalNotificationScreenState createState() => _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen>{
  @override
  void initState(){
    super.initState();
    notificationPlugin.setListenerForLowerVersoins(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Local Notification'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async{
            await notificationPlugin.showNotification();
          },
          child: Text('Send Notification')
        ),
      ),
    );
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification){

  }
  onNotificationClick(String payload){

  }
}
/*
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('app_icon');
final IOSInitializationSettings initializationSettingsIOS =
IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification);
final MacOSInitializationSettings initializationSettingsMacOS =
MacOSInitializationSettings();
final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS);
await flutterLocalNotificationsPlugin.initialize(initializationSettings,
onSelectNotification: selectNotification);*/