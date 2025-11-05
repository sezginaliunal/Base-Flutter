/// AppLocaleKeys
/// Tüm dil dosyası anahtarlarını merkezi olarak yönetir.
abstract class AppLocaleKeys {
  // INIT
  static const error = 'init.error';
  static const loading = 'init.loading';
  static const success = 'init.success';
  static const networkError = 'init.network_error';
  static const retry = 'init.retry';
  static const cancel = 'init.cancel';
  static const ok = 'init.ok';
  static const yes = 'init.yes';
  static const no = 'init.no';

  // APP
  static const appTitle = 'app.title';
  static const appVersion = 'app.version';
  static const appLogout = 'app.logout';
  static const appLanguage = 'app.language';
  static const appTheme = 'app.theme';
  static const appDarkMode = 'app.dark_mode';
  static const appLightMode = 'app.light_mode';
  static const appSettings = 'app.settings';
  static const appAbout = 'app.about';
  static const appPrivacyPolicy = 'app.privacy_policy';
  static const appTerms = 'app.terms';

  // AUTH
  static const authLogin = 'auth.login';
  static const authLogout = 'auth.logout';
  static const authRegister = 'auth.register';
  static const authSignup = 'auth.signup';
  static const authSignin = 'auth.signin';
  static const authForgotPassword = 'auth.forgot_password';
  static const authResetPassword = 'auth.reset_password';
  static const authNewPassword = 'auth.new_password';
  static const authConfirmPassword = 'auth.confirm_password';
  static const authOldPassword = 'auth.old_password';
  static const authChangePassword = 'auth.change_password';
  static const authEmail = 'auth.email';
  static const authUsername = 'auth.username';
  static const authPassword = 'auth.password';
  static const authRememberMe = 'auth.remember_me';
  static const authDontHaveAccount = 'auth.dont_have_account';
  static const authAlreadyHaveAccount = 'auth.already_have_account';
  static const authVerificationCode = 'auth.verification_code';
  static const authSendCode = 'auth.send_code';
  static const authVerify = 'auth.verify';
  static const authLoginSuccess = 'auth.login_success';
  static const authRegisterSuccess = 'auth.register_success';

  // HOME
  static const home = 'home.home';
  static const homeDashboard = 'home.dashboard';
  static const homeWelcome = 'home.welcome';
  static const homeSearch = 'home.search';
  static const homeSearchPlaceholder = 'home.search_placeholder';
  static const homeNotifications = 'home.notifications';
  static const homeViewAll = 'home.view_all';
  static const homeRecentActivity = 'home.recent_activity';
  static const homeSeeMore = 'home.see_more';

  // PROFILE
  static const profile = 'profile.profile';
  static const profileEdit = 'profile.edit_profile';
  static const profileUpdate = 'profile.update_profile';
  static const profileFirstName = 'profile.first_name';
  static const profileLastName = 'profile.last_name';
  static const profileFullName = 'profile.full_name';
  static const profilePhone = 'profile.phone';
  static const profileAddress = 'profile.address';
  static const profileCity = 'profile.city';
  static const profileCountry = 'profile.country';
  static const profileSaveChanges = 'profile.save_changes';
  static const profileUploadPhoto = 'profile.upload_photo';
  static const profileRemovePhoto = 'profile.remove_photo';

  // FORMS
  static const formSubmit = 'forms.submit';
  static const formSave = 'forms.save';
  static const formUpdate = 'forms.update';
  static const formDelete = 'forms.delete';
  static const formAdd = 'forms.add';
  static const formEdit = 'forms.edit';
  static const formClear = 'forms.clear';
  static const formBack = 'forms.back';
  static const formNext = 'forms.next';
  static const formPrevious = 'forms.previous';
  static const formConfirm = 'forms.confirm';
  static const formClose = 'forms.close';
  static const formOpen = 'forms.open';
  static const formSelect = 'forms.select';
  static const formChooseFile = 'forms.choose_file';
  static const formNoData = 'forms.no_data';
  static const formRequiredField = 'forms.required_field';

  // VALIDATION
  static const valInvalidEmail = 'validation.invalid_email';
  static const valPasswordMismatch = 'validation.password_mismatch';
  static const valPasswordShort = 'validation.password_short';
  static const valFieldRequired = 'validation.field_required';
  static const valMinLength = 'validation.min_length';
  static const valMaxLength = 'validation.max_length';
  static const valInvalidFormat = 'validation.invalid_format';
  static const valSomethingWrong = 'validation.something_went_wrong';
  static const valEmailRequired = 'validation.email_required';
  static const valPasswordRequired = 'validation.password_required';
  static const valPasswordMinLength = 'validation.password_min_length';
  static const valInvalidNumber = 'validation.invalid_number';
  static const valPhoneRequired = 'validation.phone_required';
  static const valInvalidPhone = 'validation.invalid_phone';
  static const valInvalidUrl = 'validation.invalid_url';

  // ITEMS
  static const items = 'items.items';
  static const itemsAdd = 'items.add_item';
  static const itemsEdit = 'items.edit_item';
  static const itemsDelete = 'items.delete_item';
  static const itemsList = 'items.item_list';
  static const itemsDetails = 'items.item_details';
  static const itemsEmpty = 'items.empty_list';

  // CART
  static const cart = 'cart.cart';
  static const cartAdd = 'cart.add_to_cart';
  static const cartRemove = 'cart.remove_from_cart';
  static const cartCheckout = 'cart.checkout';
  static const cartTotal = 'cart.total';
  static const cartQuantity = 'cart.quantity';
  static const cartPrice = 'cart.price';
  static const cartSubtotal = 'cart.subtotal';
  static const cartShipping = 'cart.shipping';
  static const cartOrderSummary = 'cart.order_summary';
  static const cartPayment = 'cart.payment';
  static const cartOrderSuccess = 'cart.order_success';
  static const cartOrderFailed = 'cart.order_failed';

  // CHAT
  static const chat = 'chat.chat';
  static const chatMessages = 'chat.messages';
  static const chatNewMessage = 'chat.new_message';
  static const chatSend = 'chat.send';
  static const chatTypeMessage = 'chat.type_message';
  static const chatNoMessages = 'chat.no_messages';
  static const chatOnline = 'chat.online';
  static const chatOffline = 'chat.offline';
  static const chatLastSeen = 'chat.last_seen';

  // ERRORS
  static const errError = 'errors.error';
  static const errNotFound = 'errors.not_found';
  static const errUnauthorized = 'errors.unauthorized';
  static const errForbidden = 'errors.forbidden';
  static const errInternalServer = 'errors.internal_server_error';
  static const errTimeout = 'errors.timeout';
  static const errNoInternet = 'errors.no_internet';
  static const errTryAgain = 'errors.try_again';

  // NOTIFICATIONS
  static const notifNew = 'notifications.new_notification';
  static const notifMarkRead = 'notifications.mark_as_read';
  static const notifMarkAllRead = 'notifications.mark_all_as_read';
  static const notifNone = 'notifications.no_notifications';

  // DATES
  static const dateToday = 'dates.today';
  static const dateYesterday = 'dates.yesterday';
  static const dateTomorrow = 'dates.tomorrow';
  static const dateThisWeek = 'dates.this_week';
  static const dateLastWeek = 'dates.last_week';
  static const dateThisMonth = 'dates.this_month';
  static const dateLastMonth = 'dates.last_month';
  static const dateDate = 'dates.date';
  static const dateTime = 'dates.time';

  // ALERTS
  static const alertConfirmDelete = 'alerts.confirm_delete';
  static const alertActionSuccess = 'alerts.action_success';
  static const alertActionFailed = 'alerts.action_failed';
  static const alertLogoutConfirm = 'alerts.logout_confirm';
  static const alertUnsavedChanges = 'alerts.unsaved_changes';

  // PERMISSIONS
  static const permCamera = 'permissions.camera_permission';
  static const permGallery = 'permissions.gallery_permission';
  static const permLocation = 'permissions.location_permission';
  static const permMicrophone = 'permissions.microphone_permission';

  // ONBOARDING
  static const onboardSkip = 'onboarding.skip';
  static const onboardNext = 'onboarding.next';
  static const onboardDone = 'onboarding.done';
  static const onboardGetStarted = 'onboarding.get_started';
  static const onboardWelcomeTitle = 'onboarding.welcome_title';
  static const onboardWelcomeDesc = 'onboarding.welcome_description';
}
