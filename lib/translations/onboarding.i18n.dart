import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "Meeting from anywhere",
        "fr": "Rencontre de n'importe où",
        "es": "Reunirse desde cualquier lugar",
        "de": "Treffen von überall",
        "pt": "Reunião de qualquer lugar",
        "ar": "لقاء من أي مكان",
        "ko": "어디에서나 회의"
      } +
      {
        "en": "Start/Join a meeting from anywhere in the world",
        "fr": "Démarrez / Rejoignez une réunion de n'importe où dans le monde",
        "es": "Inicie / únase a una reunión desde cualquier parte del mundo",
        "de":
            "Starten / Nehmen Sie an einem Meeting von überall auf der Welt teil",
        "pt": "Inicie / participe de uma reunião de qualquer lugar do mundo",
        "ar": "ابدأ / انضم إلى اجتماع من أي مكان في العالم",
        "ko": "전 세계 어디서나 회의 시작 / 참여"
      } +
      {
        "en": "Stay in touch",
        "fr": "Reste en contact",
        "es": "Mantente en contacto",
        "de": "In Kontakt bleiben",
        "pt": "Manter contato",
        "ar": "ابق على تواصل",
        "ko": "연락을 유지하다"
      } +
      {
        "en": "Also connected with colleagues, family & friends via messages",
        "fr":
            "Également connecté avec vos collègues, votre famille et vos amis via des messages",
        "es":
            "También conectado con colegas, familiares y amigos a través de mensajes.",
        "de":
            "Auch über Nachrichten mit Kollegen, Familie & Freunden verbunden",
        "pt":
            "Também conectado com colegas, família e amigos por meio de mensagens",
        "ar": "متصل أيضًا بالزملاء والعائلة والأصدقاء عبر الرسائل",
        "ko": "또한 메시지를 통해 동료, 가족 및 친구와 연결됩니다."
      } +
      {
        "en": "Video conferencing",
        "fr": "Vidéo conférence",
        "es": "Videoconferencia",
        "de": "Videokonferenzen",
        "pt": "Vídeo conferência",
        "ar": "مؤتمرات الفيديو",
        "ko": "화상 회의"
      } +
      {
        "en": "Start a video call on the go with colleagues, family & friends",
        "fr":
            "Démarrez un appel vidéo en déplacement avec vos collègues, votre famille et vos amis",
        "es":
            "Inicie una videollamada sobre la marcha con colegas, familiares y amigos",
        "de":
            "Starten Sie unterwegs einen Videoanruf mit Kollegen, Familie und Freunden",
        "pt":
            "Inicie uma videochamada com colegas, familiares e amigos em qualquer lugar",
        "ar": "ابدأ مكالمة فيديو أثناء التنقل مع الزملاء والعائلة والأصدقاء",
        "ko": "동료, 가족 및 친구와 이동 중에 화상 통화를 시작하세요."
      };

  String get i18n => localize(this, _t);
}
