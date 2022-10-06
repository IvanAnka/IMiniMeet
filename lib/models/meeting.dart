import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:meetup/models/user.dart';
import 'package:meetup/services/auth.service.dart';

class Meeting {
  int id;
  String meetingID;
  String meetingTitle;
  String banner;
  String created_at;
  bool isPublic;
  User user;

  Meeting({
    this.id,
    this.meetingID,
    this.meetingTitle,
    this.banner,
    this.created_at,
    this.isPublic = true,
    this.user,
  });

  factory Meeting.fromJSON(Map<String, dynamic> json) {
    final meeting = Meeting();
    if (json == null) {
      return meeting;
    }
    meeting.id = json.containsKey("id") ? json["id"] : null;
    meeting.meetingID = json["meeting_id"] ?? "";
    meeting.meetingTitle = json["meeting_title"] ?? "";
    meeting.banner = json["banner"] ?? "";
    meeting.isPublic = int.parse((json["public"] ?? "1").toString()) == 1;
    meeting.created_at = json["created_at"] ?? null;
    meeting.user = json["user"] != null ? User.fromJson(json["user"]) : null;
    return meeting;
  }

  String get meetingDate {
    final formattedDateTime = DateTime.parse(this.created_at);
    final dateClean = DateFormat("dd MMM, yyy \| hh:mm a", I18n.language)
        .format(formattedDateTime);
    return dateClean.toString();
  }

  bool get mine {
    if (AuthServices.authenticated()) {
      return AuthServices.currentUser.id == this.user?.id;
    } else {
      return false;
    }
  }
}
