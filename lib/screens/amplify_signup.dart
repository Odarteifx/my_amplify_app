import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_amplify_app/widgets/widgets.dart';

class AmplifySignup extends StatefulWidget {
  const AmplifySignup({super.key});

  @override
  State<AmplifySignup> createState() => _AmplifySignupState();
}

class _AmplifySignupState extends State<AmplifySignup> {
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
              child: SignUpWidget(),
            ),
          )
        ],
      ),
    );
  }
}

String name = '';
String email = '';
String password = '';
String confirmPassword = '';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _hidepassword = true;

  registration() async {
    if (_formkey.currentState!.validate()) {
      name = _nameController.text.trim();
      email = _emailController.text.trim();
      password = _passwordController.text.trim();
      confirmPassword = _confirmPasswordController.text.trim();

      try {
        final signUpResult = await Amplify.Auth.signUp(
            username: _nameController.text.trim(),
            password: _passwordController.text.trim(),
            options: SignUpOptions(userAttributes: {
              AuthUserAttributeKey.email: _emailController.text.trim()
            }));

        if (signUpResult.isSignUpComplete) {
          debugPrint('Succesfully Created Account');
        } else {
          debugPrint('Failed Creating Account');
        }
      } on AuthException catch (e) {
        debugPrint('$e');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    } else{

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Get Started',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            NameField(nameController: _nameController),
            EmailAddress(emailController: _emailController),
            TextFormField(
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
            ),
            TextFormField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _hidepassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm Password',
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
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 55,
                      child: FilledButton(
                          onPressed: () {
                            registration();
                          },
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ))),
                ),
              ],
            ),
            Amplifydivider(
              dividertext: 'Sign up with',
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
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () => context.goNamed('signInpage'),
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Color(0xFF19647E)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
