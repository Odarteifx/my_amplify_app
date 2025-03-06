import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_amplify_app/router.dart';
import 'package:my_amplify_app/screens/amplify_onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
    );
  }
}

class AmplifyHome extends StatelessWidget {
  const AmplifyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AmplifyOnboarding();
  }
}