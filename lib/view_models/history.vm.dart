import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meetup/constants/app_routes.dart';
import 'package:meetup/models/meeting.dart';
import 'package:meetup/models/user.dart';
import 'package:meetup/requests/meeting.request.dart';
import 'package:meetup/services/auth.service.dart';
import 'package:meetup/view_models/base.view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/dialogs.i18n.dart';

class HistoryViewModel extends MyBaseViewModel {
  //
  MeetingRequest _meetingRequest = MeetingRequest();
  //
  User currentUser;
  //
  int queryPage = 1;
  List<Meeting> meetings = [];
  RefreshController refreshController = RefreshController();

  //
  HistoryViewModel(BuildContext context) {
    this.viewContext = context;
  }

  void initialise() async {
    //
    if (await AuthServices.authenticated()) {
      currentUser = await AuthServices.getCurrentUser(force: true);

      //
      getMeeting();
    }
    notifyListeners();
  }

  void getMeeting({bool initial = true}) async {
    //
    initial ? queryPage = 1 : queryPage++;
    //
    if (initial) {
      setBusy(true);
      refreshController.refreshCompleted();
    }
    //
    final mMeetings = await _meetingRequest.myMeetingsRequest(page: queryPage);
    if (initial) {
      meetings = mMeetings;
    } else {
      meetings.addAll(mMeetings);
    }

    //
    initial ? setBusy(false) : refreshController.loadComplete();
  }

  //initiate the vidoe call
  initiateNewMeeting(Meeting meeting) async {
    try {
      // FeatureFlag featureFlag = FeatureFlag();
      // featureFlag.welcomePageEnabled = false;
      // // Limit video resolution to 360p
      // featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
      // featureFlag.chatEnabled = true;

      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
        FeatureFlagEnum.CHAT_ENABLED: true,
        FeatureFlagEnum.INVITE_ENABLED: meeting.mine,
        FeatureFlagEnum.ADD_PEOPLE_ENABLED: meeting.mine,
        // FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      };

      var options = JitsiMeetingOptions(room: meeting.meetingID)
        ..subject = meeting.meetingTitle
        ..userDisplayName = currentUser?.name
        ..userAvatarURL = ""
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        ..featureFlags.addAll(featureFlags);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      viewContext.showToast(
        msg: "There was an error joining new meeting".i18n,
      );
    }
  }

  openLogin() async {
    viewContext.navigator.pushNamed(
      AppRoutes.loginRoute,
    );
  }
}
