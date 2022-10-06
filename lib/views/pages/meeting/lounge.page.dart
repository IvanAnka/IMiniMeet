import 'package:flutter/material.dart';
import 'package:meetup/view_models/lounge.vm.dart';
import 'package:meetup/widgets/base.page.dart';
import 'package:meetup/widgets/custom_list_view.dart';
import 'package:meetup/widgets/list_items/history.list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/lounge.i18n.dart';

class LoungePage extends StatefulWidget {
  const LoungePage({Key key}) : super(key: key);

  @override
  _LoungePageState createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage>
    with AutomaticKeepAliveClientMixin<LoungePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePage(
      body: ViewModelBuilder<LoungeViewModel>.reactive(
        viewModelBuilder: () => LoungeViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return VStack(
            [
              //title
              "Public Meetings"
                  .i18n
                  .text
                  .xl2
                  .semiBold
                  .make()
                  .pOnly(bottom: Vx.dp10),
              //
              CustomListView(
                dataSet: model.publicMeetings,
                isLoading: model.busy(model.publicMeetings),
                itemBuilder: (context, index) {
                  //
                  final meeting = model.publicMeetings[index];
                  return HistoryListItem(
                    meeting,
                    () => model.initiateNewMeeting(
                      meeting: meeting,
                    ),
                  );
                },
                refreshController: model.refreshController,
                canRefresh: true,
                canPullUp: true,
                onRefresh: model.getPublicMeetings,
                onLoading: () => model.getPublicMeetings(initial: false),
              ).expand(),
            ],
          ).p20().pOnly(bottom: Vx.dp64);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
