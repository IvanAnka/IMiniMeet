import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meetup/view_models/home.vm.dart';
import 'package:meetup/views/pages/history.page.dart';
import 'package:meetup/views/pages/meeting/lounge.page.dart';
import 'package:meetup/views/pages/meeting/meeting.page.dart';
import 'package:meetup/views/pages/profile.page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/home.i18n.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: model.pageViewController,
                  onPageChanged: model.onPageChanged,
                  children: [
                    //History
                    HistoryPage(),
                    //Meeting
                    MeetingPage(),
                    //
                    LoungePage(),
                    //profile
                    ProfilePage(),
                  ],
                ),

                //ad
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: AdWidget(ad: model.myBanner),
                    width: model.myBanner.size.width.toDouble(),
                    height: model.myBanner.size.height.toDouble(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: VxBox(
            child: SafeArea(
              child: GNav(
                gap: 2,
                activeColor: Colors.white,
                color: Theme.of(context).textTheme.bodyText1.color,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: Theme.of(context).accentColor,
                tabs: [
                  GButton(
                    icon: LineIcons.history,
                    text: 'History'.i18n,
                  ),
                  GButton(
                    icon: LineIcons.video_camera,
                    text: 'Meeting'.i18n,
                  ),
                  GButton(
                    icon: LineIcons.group,
                    text: 'Lounge'.i18n,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile'.i18n,
                  ),
                ],
                selectedIndex: model.currentIndex,
                onTabChange: model.onTabChange,
              ),
            ),
          )
              .p16
              .shadow
              .color(Theme.of(context).bottomSheetTheme.backgroundColor)
              .make(),
        );
      },
    );
  }
}
