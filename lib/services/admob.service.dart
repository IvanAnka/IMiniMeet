import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' hide Ad;
import 'package:meetup/models/ad.dart';
import 'package:meetup/services/auth.service.dart';

class AdmobService {
  //
  static Ad ad;
  static initialize() async {
    //getting ad settings
    ad = await AuthServices.getAd();
  }

  //
  static String get appID {
    //

    if (Platform.isAndroid) {
      return ad.android.appId;
    } else {
      return ad.ios.appId;
    }
  }

  static String get adUnitID {
    //load ad only on release mode, to avoid been banned by admob
    if (!kReleaseMode) {
      return BannerAd.testAdUnitId;
    }

    if (Platform.isAndroid) {
      return ad.android.bannerAdId ?? BannerAd.testAdUnitId;
    } else {
      return ad.ios.bannerAdId ?? BannerAd.testAdUnitId;
    }
  }
}
