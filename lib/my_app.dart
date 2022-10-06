import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:meetup/constants/app_strings.dart';
import 'package:meetup/services/auth.service.dart';
import 'package:meetup/views/pages/splash.page.dart';
import 'package:meetup/services/router.service.dart' as router;

import 'constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: router.generateRoute,
      // initialRoute: _startRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('es'),
        const Locale('de'),
        const Locale('ar'),
        const Locale('ko'),
      ],
      home: I18n(
        child: SplashPage(),
        initialLocale: Locale(AuthServices.getLocale()),
      ),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        accentColor: AppColor.accentColor,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.cursorColor,
        ),
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        accentColor: AppColor.accentColor,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.cursorColor,
        ),
        backgroundColor: Colors.grey[850],
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
