import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_delight_task/auth/service/auth_service.dart';
import 'package:work_delight_task/auth/ui/sign_up_screen.dart';
import 'package:work_delight_task/dashboard/home_screen.dart';
import 'package:work_delight_task/utils/string_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false; // Added boolean to track loading state

  @override
  void initState() {
    emailController.text = 'yogesh@gmail.com';
    passwordController.text = '123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: username,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return enterUserName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: password,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return enterPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      doLogin(context);
                    },
                    child: const Text(login),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(sigUp),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading) // Show circular progress indicator when isLoading is true
            CircularProgressIndicator(),
        ],
      ),
    );
  }

  Future<void> doLogin(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true; // Set isLoading to true when starting login
      });

      final AuthService auth = AuthService();
      UserCredential? result =
      await auth.signIn(emailController.text, passwordController.text);

      setState(() {
        isLoading = false; // Set isLoading to false when login completes
      });

      if (result != null && mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        print('Sign in failed $result');
      }
    }
  }
}
