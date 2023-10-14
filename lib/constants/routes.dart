import 'package:feedback_app/pages/workers_list_page.dart';
import 'package:feedback_app/pages/login_register_page.dart';

var appRoutes = {
  EmailPasswordLoginRegister.routeName: (context) =>
      const EmailPasswordLoginRegister(),
  WorkersListPage.routeName: (context) => const WorkersListPage(),
};
