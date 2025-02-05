import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app.dart';
// import 'config/firebase_options.dart'; // Firebase config file

void main() async {
  // 📌 Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseOptions.initializeApp();

  // 📌 Request Permissions
  await requestPermissions();

  runApp(ProviderScope(child: MyApp()));
}

// 📌 Request runtime permissions
Future<void> requestPermissions() async {
  await [
    Permission.notification,
    // Permission.camera,
    Permission.photos,
    Permission.videos
  ].request();
}
