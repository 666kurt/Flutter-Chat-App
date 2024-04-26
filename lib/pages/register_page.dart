import 'package:chat_app/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function() togglePage;

  RegisterPage({super.key, required this.togglePage});

  void registerMethod(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUp(_emailController.text, _confirmPasswordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password dont match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(
              height: 50,
            ),

            // message
            Text(
              'Create an account',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // email tf
            CustomTextField(
              hintText: 'Email',
              isHidden: false,
              controller: _emailController,
            ),

            SizedBox(height: 10),

            // password tf
            CustomTextField(
              hintText: 'Password',
              isHidden: true,
              controller: _passwordController,
            ),

            SizedBox(height: 10),

            // password tf
            CustomTextField(
              hintText: 'Confirm password',
              isHidden: true,
              controller: _confirmPasswordController,
            ),

            SizedBox(height: 20),

            // login button
            CustomButton(
              text: 'Register',
              onTap: () => registerMethod(context),
            ),

            SizedBox(height: 20),

            // register label

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: togglePage,
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
