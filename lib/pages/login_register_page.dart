import 'package:feedback_app/interface/firebase_auth.dart';
import 'package:feedback_app/widgets/custom_button.dart';
import 'package:feedback_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailPasswordLoginRegister extends StatefulWidget {
  static String routeName = '/login-email-password';
  const EmailPasswordLoginRegister({Key? key}) : super(key: key);

  @override
  EmailPasswordLoginRegisterState createState() => EmailPasswordLoginRegisterState();
}

class EmailPasswordLoginRegisterState extends State<EmailPasswordLoginRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Feedback App",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              isPassword: true,
              onEnter: (String s) => {
                loginUser()
              }
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(onTap: loginUser, text: "Login"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(onTap: signUpUser, text: "Register"),
          ),
        ],
      ),
    );
  }
}
