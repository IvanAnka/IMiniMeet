import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meetup/services/admob.service.dart';
import 'package:meetup/view_models/base.view_model.dart';

class HomeViewModel extends MyBaseViewModel {
  //
  HomeViewModel(BuildContext context) {
    this.viewContext = context;
  }

  //
  int currentIndex = 1;

  //
  bool adLoaded = false;
  BannerAd myBanner;

  PageController pageViewController = PageController(initialPage: 1);

  //
  initialise() {
    loadBanner();
  }

  //
  onPageChanged(int index) {
    currentIndex = index;

    if (index != 3) {
      loadBanner();
    } else {
      closeBanner();
    }
    notifyListeners();
  }

  //
  onTabChange(int index) {
    currentIndex = index;
    pageViewController.animateToPage(
      currentIndex,
      duration: Duration(microseconds: 5),
      curve: Curves.bounceInOut,
    );
    notifyListeners();
  }

  //
  initiateAd() async {
    myBanner = BannerAd(
      adUnitId: AdmobService.adUnitID ?? BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        print("Ad loaded ==> ${ad}");
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print("Ad onAdFailedToLoad ==> ${ad}");
      }),
    );
    // myBanner = BannerAd(
    //   adUnitId: AdmobService.adUnitID ?? BannerAd.testAdUnitId,
    //   size: AdSize.banner,
    //   listener: (MobileAdEvent event) {
    //     print("BannerAd event is $event");
    //   },
    // );
  }

  //
  loadBanner() {
    //

    //
    if (!adLoaded) {
      initiateAd();
      myBanner..load();
      adLoaded = true;
    }
  }

  //
  closeBanner() {
    if (adLoaded) {
      myBanner.dispose();
      adLoaded = false;
    }
  }
}
