import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "Profile Update",
        "fr": "Mise à jour du profil",
        "es": "Actualización de perfil",
        "de": "Profilaktualisierung",
        "pt": "Atualização de Perfil",
        "ar": "تحديث الملف الشخصي",
        "ko": "프로필 업데이트"
      } +
      {
        "en": "There was an error joining new meeting",
        "fr":
            "Une erreur s'est produite lors de la connexion à une nouvelle réunion",
        "es": "Se produjo un error al unirse a una nueva reunión.",
        "de": "Beim Beitritt zu einem neuen Meeting ist ein Fehler aufgetreten",
        "pt": "Ocorreu um erro ao entrar na nova reunião",
        "ar": "حدث خطأ أثناء الانضمام إلى الاجتماع الجديد",
        "ko": "새 회의에 참여하는 중에 오류가 발생했습니다."
      } +
      {
        "en": "Untitled",
        "fr": "Sans titre",
        "es": "Intitulado",
        "de": "Ohne Titel",
        "pt": "Sem título",
        "ar": "بدون عنوان",
        "ko": "제목 없음"
      } +
      {
        "en": "Registration Failed",
        "fr": "Échec de l'enregistrement",
        "es": "Registro fallido",
        "de": "Registrierung fehlgeschlagen",
        "pt": "Registração falhou",
        "ar": "فشل في التسجيل",
        "ko": "등록 실패"
      } +
      {
        "en": "Login Failed",
        "fr": "Échec de la connexion",
        "es": "Error de inicio de sesion",
        "de": "Fehler bei der Anmeldung",
        "pt": "Falha no login",
        "ar": "فشل تسجيل الدخول",
        "ko": "로그인 실패"
      } +
      {
        "en": "Logout",
        "fr": "Se déconnecter",
        "es": "Cerrar sesión",
        "de": "Ausloggen",
        "pt": "Sair",
        "ar": "تسجيل خروج",
        "ko": "로그 아웃"
      } +
      {
        "en": "Are you sure you want to logout?",
        "fr": "Êtes-vous sûr de vouloir vous déconnecter?",
        "es": "¿Está seguro de que desea cerrar la sesión?",
        "de": "Möchten Sie sich abmelden?",
        "pt": "Tem certeza que deseja sair?",
        "ar": "هل أنت متأكد أنك تريد تسجيل الخروج؟",
        "ko": "로그 아웃 하시겠습니까?"
      } +
      {
        "en": "Logging out Please wait...",
        "fr": "Déconnexion Veuillez patienter ...",
        "es": "Cerrar sesión Espere ...",
        "de": "Abmelden Bitte warten ...",
        "pt": "Saindo Por favor, aguarde ...",
        "ar": "تسجيل الخروج الرجاء الانتظار ...",
        "ko": "로그 아웃 잠시만 기다려주십시오 ..."
      } +
      {
        "en": "Delete Account",
        "fr": "Supprimer le compte",
        "es": "Borrar cuenta",
        "de": "Konto löschen",
        "pt": "Deletar conta",
        "ar": "حذف الحساب",
        "ko": "계정 삭제"
      } +
      {
        "en": "Are you sure you want to delete your account?",
        "fr": "Voulez-vous vraiment supprimer votre compte?",
        "es": "¿Estás seguro de que deseas eliminar tu cuenta?",
        "de": "Möchten Sie Ihr Konto wirklich löschen?",
        "pt": "Tem certeza que deseja deletar sua conta?",
        "ar": "هل انت متأكد انك تريد حذف حسابك؟",
        "ko": "계정을 삭제 하시겠습니까?"
      } +
      {
        "en": "Deleting Account. Please wait...",
        "fr": "Suppression du compte. S'il vous plaît, attendez...",
        "es": "Eliminando cuenta. Espere por favor...",
        "de": "Konto löschen. Warten Sie mal...",
        "pt": "Excluindo conta. Por favor, espere...",
        "ar": "حذف الحساب. انتظر من فضلك...",
        "ko": "계정 삭제. 잠시만 기다려주세요 ..."
      };

  String get i18n => localize(this, _t);
}
