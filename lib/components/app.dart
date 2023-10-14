import 'package:feedback_app/components/app_bar.dart';
import 'package:feedback_app/constants/routes.dart';
import 'package:feedback_app/interface/firebase_auth.dart';
import 'package:feedback_app/pages/login_register_page.dart';
import 'package:feedback_app/pages/workers_list_page.dart';
import 'package:feedback_app/widgets/side_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Share your Feedback App',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
            useMaterial3: true,
          ),
          home: const AuthWrapper(),
          routes: appRoutes,
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return Scaffold(
          drawer: const SideMenu(),
          appBar: appBar(context, "Share your Feedback"),
          body: const WorkersListPage());
    }
    return const EmailPasswordLoginRegister();
  }
}
