import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "Public Meetings",
        "fr": "Réunions publiques",
        "es": "Reuniones públicas",
        "de": "Öffentliche Versammlungen",
        "pt": "Reuniões Públicas",
        "ar": "الاجتماعات العامة",
        "ko": "공개 회의"
      } +
      {
        "en": "Private",
        "fr": "Privé",
        "es": "Privado",
        "de": "Privat",
        "pt": "Privado",
        "ar": "خاص",
        "ko": "은밀한"
      } +
      {
        "en": "Public",
        "fr": "Publique",
        "es": "Público",
        "de": "Öffentlichkeit",
        "pt": "Público",
        "ar": "عامة",
        "ko": "공공의"
      };

  String get i18n => localize(this, _t);
}
