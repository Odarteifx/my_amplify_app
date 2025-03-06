import 'package:go_router/go_router.dart';
import 'package:my_amplify_app/screens/amplify_onboarding.dart';
import 'package:my_amplify_app/screens/amplify_signin.dart';
import 'package:my_amplify_app/screens/amplify_signup.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => AmplifyOnboarding(),
  ),
  GoRoute(
    name: 'signInpage',
    path: '/signin',
    builder: (context, state) => AmplifySignin(),
  ),
  GoRoute(
    name: 'signUppage',
    path: '/signup',
    builder: (context, state) => AmplifySignup(),
  )
]);
