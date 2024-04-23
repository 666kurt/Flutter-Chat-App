import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  void loginMethod() {
    print('tap on login button');
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
              'Welcome back!',
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

            SizedBox(height: 20),

            // login button
            CustomButton(
              text: 'Login',
              onTap: loginMethod,
            ),

            // register label
          ],
        ),
      ),
    );
  }
}
