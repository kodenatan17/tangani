import 'package:get/get.dart';

import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/views/activity_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/chat_search/bindings/chat_search_binding.dart';
import '../modules/chat_search/views/chat_search_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_change/bindings/profile_change_binding.dart';
import '../modules/profile_change/views/profile_change_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/report_main/bindings/report_main_binding.dart';
import '../modules/report_main/views/report_main_view.dart';
import '../modules/tangaambulance/bindings/tangaambulance_binding.dart';
import '../modules/tangaambulance/views/tangaambulance_view.dart';
import '../modules/tangapangan/bindings/tangapangan_binding.dart';
import '../modules/tangapangan/views/tangapangan_view.dart';
import '../modules/tangapeta/bindings/tangapeta_binding.dart';
import '../modules/tangapeta/views/tangapeta_view.dart';
import '../modules/tangaresponse/bindings/tangaresponse_binding.dart';
import '../modules/tangaresponse/views/tangaresponse_view.dart';
import '../modules/tangasiaga/bindings/tangasiaga_binding.dart';
import '../modules/tangasiaga/views/tangasiaga_view.dart';
import '../modules/tangawarta/bindings/tangawarta_binding.dart';
import '../modules/tangawarta/views/tangawarta_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TANGAPETA,
      page: () => TangapetaView(),
      binding: TangapetaBinding(),
    ),
    GetPage(
      name: _Paths.TANGAWARTA,
      page: () => TangawartaView(),
      binding: TangawartaBinding(),
    ),
    GetPage(
      name: _Paths.TANGARESPONSE,
      page: () => TangaresponseView(),
      binding: TangaresponseBinding(),
    ),
    GetPage(
      name: _Paths.TANGAPANGAN,
      page: () => TangapanganView(),
      binding: TangapanganBinding(),
    ),
    GetPage(
      name: _Paths.TANGAAMBULANCE,
      page: () => TangaambulanceView(),
      binding: TangaambulanceBinding(),
    ),
    GetPage(
      name: _Paths.TANGASIAGA,
      page: () => TangasiagaView(),
      binding: TangasiagaBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_MAIN,
      page: () => ReportMainView(),
      binding: ReportMainBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_CHANGE,
      page: () => ProfileChangeView(),
      binding: ProfileChangeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SEARCH,
      page: () => ChatSearchView(),
      binding: ChatSearchBinding(),
    ),
  ];
}
