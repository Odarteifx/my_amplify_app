import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/widgets.dart';

class AmplifySignin extends StatelessWidget {
  const AmplifySignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 650,
              width: 394,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: SignInWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
  });

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Welcome Back',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            EmailAddress(emailController: _emailController),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                password(),
                const SizedBox(height: 5),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Color(0xFF19647E)),
                    )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 55,
                      child: FilledButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              // Form is valid, proceed with sign in
                              print('Form is valid');
                              print('Email: ${_emailController.text.trim()}');
                              print(
                                  'Password: ${_passwordController.text.trim()}');
                            }
                          },
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ))),
                ),
              ],
            ),
            Amplifydivider(
              dividertext: 'Sign in with',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 18,
              children: [
                LoginOption(
                  iconImage: 'assets/facebook.png',
                  iconFunction: () {},
                ),
                LoginOption(
                    iconImage: 'assets/google.png', iconFunction: () {}),
                LoginOption(
                    iconImage: 'assets/apple-logo.png', iconFunction: () {})
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                GestureDetector(
                    onTap: () => context.goNamed('signUppage'),
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Color(0xFF19647E)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _hidepassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidepassword = !_hidepassword;
              });
            },
            icon: Icon(
              _hidepassword ? Iconsax.eye : Iconsax.eye_slash,
              color: Colors.grey,
            )),
        filled: true,
        fillColor: Colors.grey[50],
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
      ),
    );
  }
}

class EmailAddress extends StatelessWidget {
  const EmailAddress({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        filled: true,
        fillColor: Colors.grey[50],
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
      ),
    );
  }
}
