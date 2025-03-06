import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AmplifyOnboarding extends StatelessWidget {
  const AmplifyOnboarding({super.key});

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Just testing Amplify Auths & Storage',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 20,
             left: 0,
             right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      SizedBox(
                          height: 60,
                          width: 165,
                          child: FilledButton.tonal(
                              onPressed: () {
                                context.goNamed('signInpage');
                              },
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ))),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ))),
                              SizedBox(
                          height: 60,
                          width: 165,
                          child: FilledButton(
                              onPressed: () {
                                context.goNamed('signUppage');
                              },
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ))),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
