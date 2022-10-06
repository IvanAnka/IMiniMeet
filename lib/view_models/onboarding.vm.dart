import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:meetup/constants/app_images.dart';
import 'package:meetup/constants/app_routes.dart';
import 'package:meetup/constants/app_strings.dart';
import 'package:meetup/services/auth.service.dart';
import 'base.view_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/onboarding.i18n.dart';

class OnboardingViewModel extends MyBaseViewModel {
  OnboardingViewModel(BuildContext context) {
    this.viewContext = context;
  }

  final PageController pageController = PageController();

  final List<OnBoardModel> onBoardData = [
    OnBoardModel(
      title: "Meeting from anywhere".i18n,
      description: "Start/Join a meeting from anywhere in the world".i18n,
      imgUrl: AppImages.onboarding1,
    ),
    OnBoardModel(
      title: "Stay in touch".i18n,
      description:
          "Also connected with colleagues, family & friends via messages".i18n,
      imgUrl: AppImages.onboarding2,
    ),
    OnBoardModel(
      title: "Video conferencing".i18n,
      description:
          "Start a video call on the go with colleagues, family & friends".i18n,
      imgUrl: AppImages.onboarding3,
    ),
  ];

  void onDonePressed() async {
   
    await AuthServices.prefs.setBool(AppStrings.firstTimeOnApp, false);
    viewContext.navigator.pushNamedAndRemoveUntil(
      AppRoutes.homeRoute,
      (route) => false,
    );
  }
}
