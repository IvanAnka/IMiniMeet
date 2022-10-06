import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
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
        "en": "Join Meeting",
        "fr": "Rejoindre la réunion",
        "es": "Unirse a la reunión",
        "de": "Tritt dem Treffen bei",
        "pt": "Junte-se ao encontro",
        "ar": "أنضم إلى الأجتماع",
        "ko": "회의 참여"
      } +
      {
        "en": "Host Meeting",
        "fr": "Réunion hôte",
        "es": "Reunión anfitriona",
        "de": "Host Meeting",
        "pt": "Reunião anfitriã",
        "ar": "الاجتماع المضيف",
        "ko": "회의 주최"
      } +
      {
        "en": "Join an existing meeting",
        "fr": "Rejoindre une réunion existante",
        "es": "Unirse a una reunión existente",
        "de": "Nehmen Sie an einem bestehenden Meeting teil",
        "pt": "Participe de uma reunião existente",
        "ar": "انضم إلى اجتماع موجود",
        "ko": "기존 회의에 참여"
      } +
      {
        "en": "Meeting ID",
        "fr": "ID de la réunion",
        "es": "ID de reunión",
        "de": "Konferenz-ID",
        "pt": "ID da reunião",
        "ar": "معرف الاجتماع",
        "ko": "회의 ID"
      } +
      {
        "en": "Nick Name",
        "fr": "Surnom",
        "es": "Apodo",
        "de": "Spitzname",
        "pt": "Apelido",
        "ar": "اسم الشهرة",
        "ko": "닉네임"
      } +
      {
        "en": "Join",
        "fr": "Rejoindre",
        "es": "Unirse",
        "de": "Beitreten",
        "pt": "Junte-se",
        "ar": "ينضم",
        "ko": "어울리다"
      } +
      {
        "en": "Host a new meeting",
        "fr": "Organisez une nouvelle réunion",
        "es": "Organiza una nueva reunión",
        "de": "Veranstalten Sie ein neues Meeting",
        "pt": "Organize uma nova reunião",
        "ar": "استضف اجتماعًا جديدًا",
        "ko": "새 회의 주최"
      } +
      {
        "en": "Meeting ID *",
        "fr": "ID de la réunion *",
        "es": "ID de reunión *",
        "de": "Konferenz-ID *",
        "pt": "ID da reunião *",
        "ar": "معرف الاجتماع *",
        "ko": "회의 ID *"
      } +
      {
        "en": "New Meeting ID",
        "fr": "Nouvel ID de réunion",
        "es": "Nuevo ID de reunión",
        "de": "Neue Besprechungs-ID",
        "pt": "Novo ID de reunião",
        "ar": "معرف الاجتماع الجديد",
        "ko": "새 회의 ID"
      } +
      {
        "en": "Meeting title (optional)",
        "fr": "Titre de la réunion (facultatif)",
        "es": "Título de la reunión (opcional)",
        "de": "Besprechungstitel (optional)",
        "pt": "Título da reunião (opcional)",
        "ar": "عنوان الاجتماع (اختياري)",
        "ko": "회의 제목 (선택 사항)"
      } +
      {
        "en": "Public Meeting",
        "fr": "Réunion publique",
        "es": "Reunión pública",
        "de": "Öffentliches Treffen",
        "pt": "Reunião pública",
        "ar": "اجتماع عام",
        "ko": "공개 회의"
      } +
      {
        "en": "Share Meeting",
        "fr": "Partager la réunion",
        "es": "Compartir reunión",
        "de": "Meeting teilen",
        "pt": "Compartilhar reunião",
        "ar": "شارك الاجتماع",
        "ko": "회의 공유"
      } +
      {
        "en": "Create & Enter Now",
        "fr": "Créez et entrez maintenant",
        "es": "Crear e ingresar ahora",
        "de": "Jetzt erstellen und eingeben",
        "pt": "Criar e entrar agora",
        "ar": "أنشئ وادخل الآن",
        "ko": "지금 생성 및 입력"
      } +
      {
        "en": "Select Image",
        "fr": "Sélectionnez une image",
        "es": "Seleccionar imagen",
        "de": "Bild auswählen",
        "pt": "Selecione a imagem",
        "ar": "اختر صورة",
        "ko": "이미지 선택"
      } +
      {
        "en": "Remove",
        "fr": "Supprimer",
        "es": "Eliminar",
        "de": "Entfernen",
        "pt": "Retirar",
        "ar": "يزيل",
        "ko": "없애다"
      };

  String get i18n => localize(this, _t);
}
