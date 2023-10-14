import 'dart:math';
import 'package:feedback_app/interface/firebase_auth.dart';
import 'package:feedback_app/models/worker.dart';
import 'package:feedback_app/widgets/custom_button.dart';
import 'package:feedback_app/widgets/worker_item.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class WorkersListPage extends StatefulWidget {
  static String routeName = '/home';

  const WorkersListPage({Key? key}) : super(key: key);

  @override
  WorkersListPageState createState() => WorkersListPageState();
}

class WorkersListPageState extends State<WorkersListPage> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("workers");
  }

  void addDemoWorker() {
    Worker newWorker = Worker(
        name: "(${Random().nextInt(100)}:${Random().nextInt(100)}) John Doe");
    newWorker.save();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (!user.isAnonymous && user.phoneNumber == null)
        Text("Welcome ${user.email!}"),
      if (!user.emailVerified && !user.isAnonymous)
        CustomButton(
          onTap: () {
            context.read<FirebaseAuthMethods>().sendEmailVerification(context);
          },
          text: 'Resend verify Email',
        ),
      CustomButton(onTap: addDemoWorker, text: "Add demo"),
      Flexible(
          child: SizedBox(
        height: double.infinity,
        child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int idx) {
              Map worker = snapshot.value as Map;
              worker["key"] = snapshot.key;
              return workerListItem(worker: worker);
            }),
      )),
    ]);
  }
}
