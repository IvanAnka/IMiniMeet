import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:meetup/constants/app_routes.dart';
import 'package:meetup/models/ad.dart';
import 'package:meetup/requests/settings.request.dart';
import 'package:meetup/services/admob.service.dart';
import 'package:meetup/services/auth.service.dart';
import 'package:meetup/view_models/base.view_model.dart';
import 'package:meetup/widgets/cards/language_selector.view.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashViewModel extends MyBaseViewModel {
  //
  SplashViewModel(BuildContext context) {
    this.viewContext = context;
  }

  //
  SettingsRequest settingsRequest = SettingsRequest();

  loadAppSettings() async {
    //initializing admob
    final apiResponse = await settingsRequest.appSettings();
    if (apiResponse.allGood) {
      //
      final ad = Ad.fromJson(apiResponse.body["ad"]);

      //incase no ad have been set
      try {
        await AuthServices.setAd(ad);
        await AdmobService.initialize();
      } catch (error) {
        print("Admob error => $error");
      }
      loadNextPage();
    } else {
      this.viewContext.showToast(msg: "Please check your internet connection");
    }
  }

  //
  loadNextPage() async {

    //
    if (AuthServices.firstTimeOnApp()) {
      //choose language
      await showModalBottomSheet(
        context: viewContext,
        builder: (context) {
          return AppLanguageSelector(
            onSelected: (code) async {
              viewContext.pop();
              I18n.of(viewContext).locale = Locale(code ?? "en");
              await AuthServices.setLocale(I18n.language);
            },
          );
        },
      );
    }

    //
    this.viewContext.navigator.pushNamedAndRemoveUntil(
        AuthServices.firstTimeOnApp()
            ? AppRoutes.welcomeRoute
            : AppRoutes.homeRoute,
        (route) => false);
  }
}
