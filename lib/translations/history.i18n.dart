import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "My Meetings",
        "fr": "Mes réunions",
        "es": "Mis Reuniones",
        "de": "Meine Treffen",
        "pt": "Minhas reuniões",
        "ar": "اجتماعاتي",
        "ko": "내 회의"
      };

  String get i18n => localize(this, _t);
}
