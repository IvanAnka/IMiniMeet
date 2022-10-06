import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:meetup/constants/api.dart';
import 'package:meetup/constants/app_routes.dart';
import 'package:meetup/constants/app_strings.dart';
import 'package:meetup/models/user.dart';
import 'package:meetup/requests/auth.request.dart';
import 'package:meetup/services/auth.service.dart';
import 'package:meetup/view_models/base.view_model.dart';
import 'package:meetup/widgets/cards/language_selector.view.dart';
import 'package:package_info/package_info.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/dialogs.i18n.dart';

class ProfileViewModel extends MyBaseViewModel {
  //
  String appVersionInfo = "";
  bool authenticated = false;
  User currentUser;

  //
  AuthRequest _authRequest = AuthRequest();

  ProfileViewModel(BuildContext context) {
    this.viewContext = context;
  }

  void initialise() async {
    //
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    String versionCode = packageInfo.buildNumber;
    appVersionInfo = "$versionName($versionCode)";
    authenticated = await AuthServices.authenticated();
    if (authenticated) {
      currentUser = await AuthServices.getCurrentUser(force: true);
    }
    notifyListeners();
  }

  /**
   * Edit Profile
   */

  openEditProfile() async {
    final result = await viewContext.navigator.pushNamed(
      AppRoutes.editProfileRoute,
    );

    if (result != null && result) {
      initialise();
    }
  }

  /**
   * Logout
   */
  logoutPressed() async {
    CoolAlert.show(
      context: viewContext,
      type: CoolAlertType.confirm,
      title: "Logout".i18n,
      text: "Are you sure you want to logout?".i18n,
      onConfirmBtnTap: () {
        viewContext.pop();
        processLogout();
      },
    );
  }

  void processLogout() async {
    //
    CoolAlert.show(
      context: viewContext,
      type: CoolAlertType.loading,
      title: "Logout".i18n,
      text: "Logging out Please wait...".i18n,
      barrierDismissible: false,
    );

    //
    final apiResponse = await _authRequest.logoutRequest();

    //
    viewContext.pop();

    if (!apiResponse.allGood) {
      //
      CoolAlert.show(
        context: viewContext,
        type: CoolAlertType.error,
        title: "Logout".i18n,
        text: apiResponse.message,
      );
    } else {
      //
      await AuthServices.logout();
      viewContext.navigator.pushNamedAndRemoveUntil(
        AppRoutes.homeRoute,
        (_) => false,
      );
    }
  }

   deleteAccountPressed() {
    CoolAlert.show(
      context: viewContext,
      type: CoolAlertType.confirm,
      title: "Delete Account".i18n,
      text: "Are you sure you want to delete your account?".i18n,
      onConfirmBtnTap: () {
        viewContext.pop();
        processAccountDelete();
      },
    );
  }
  
  void processAccountDelete() async {
    //
    CoolAlert.show(
      context: viewContext,
      type: CoolAlertType.loading,
      title: "Delete Account".i18n,
      text: "Deleting Account. Please wait...".i18n,
      barrierDismissible: false,
    );

    //
    final apiResponse = await _authRequest.deleteProfileRequest();

    //
    viewContext.pop();

    if (!apiResponse.allGood) {
      //
      CoolAlert.show(
        context: viewContext,
        type: CoolAlertType.error,
        title: "Delete Account".i18n,
        text: apiResponse.message,
      );
    } else {
      //
      await AuthServices.logout();
      viewContext.navigator.pushNamedAndRemoveUntil(
        AppRoutes.homeRoute,
        (_) => false,
      );
    }
  }




  openNotification() async {
    viewContext.navigator.pushNamed(
      AppRoutes.notificationsRoute,
    );
  }

  /**
   * App Rating & Review
   */
  openReviewApp() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(appStoreId: AppStrings.appStoreId);
    }
  }

  //
  openPrivacyPolicy() async {
    final url = Api.privacyPolicy;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      viewContext.showToast(
        msg: 'Could not launch $url',
      );
    }
  }

  //
  changeLanguage() async {
    showModalBottomSheet(
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

  openLogin() async {
    viewContext.navigator.pushNamed(
      AppRoutes.loginRoute,
    );
  }

 
}
