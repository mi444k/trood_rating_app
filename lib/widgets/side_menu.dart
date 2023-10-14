import 'package:feedback_app/interface/firebase_auth.dart';
import 'package:feedback_app/pages/workers_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text(
              'Feedback menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Workers list'),
            onTap: () =>
                {Navigator.popAndPushNamed(context, WorkersListPage.routeName)},
          ),
          // ListTile(
          //   leading: const Icon(Icons.list),
          //   title: const Text('My feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete account'),
            onTap: () =>
                {context.read<FirebaseAuthMethods>().deleteAccount(context)},
          ),
          ListTile(
            leading: const Icon(Icons.output),
            title: const Text('Logout'),
            onTap: () => {context.read<FirebaseAuthMethods>().signOut(context)},
          ),
        ],
      ),
    );
  }
}
