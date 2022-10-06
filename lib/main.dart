import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meetup/my_app.dart';
import 'package:meetup/services/auth.service.dart';
import 'package:meetup/services/firebase.service.dart';


import 'package:i18n_extension/i18n_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //check if user has signin before
  await AuthServices.getPrefs();
  await Firebase.initializeApp();
  //setting up firebase notifications
  FirebaseService.setUpFirebaseMessaging();
  MobileAds.instance.initialize();

  // Run app!
  runApp(
    I18n(
      initialLocale: Locale(AuthServices.getLocale()),
      child: new MyApp(),
    ),
  );
}
