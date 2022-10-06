import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "History",
        "fr": "Histoire",
        "es": "Historia",
        "de": "Geschichte",
        "pt": "História",
        "ar": "تاريخ",
        "ko": "역사"
      } +
      {
        "en": "Meeting",
        "fr": "Réunion",
        "es": "Reunión",
        "de": "Treffen",
        "pt": "Reunião",
        "ar": "لقاء",
        "ko": "모임"
      } +
      {
        "en": "Lounge",
        "fr": "Salon",
        "es": "Salón",
        "de": "Salon",
        "pt": "Salão",
        "ar": "صالة",
        "ko": "라운지"
      } +
      {
        "en": "Profile",
        "fr": "Profil",
        "es": "Perfil",
        "de": "Profil",
        "pt": "Perfil",
        "ar": "حساب تعريفي",
        "ko": "프로필"
      };

  String get i18n => localize(this, _t);
  String fill(List<Object> params) => localizeFill(this, params);
}
