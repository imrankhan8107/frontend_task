import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Providers/AuthProvider.dart';
import 'package:task1/Screens/SignUpPage.dart';
import 'Screens/HomePage.dart';
import 'Screens/LogInPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> UserAuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWidget(),
        routes: {
          '/login': (context) => const LogInPage(),
          '/signUp': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserAuthProvider authProvider = Provider.of<UserAuthProvider>(context);
    if (authProvider.isLoggedIn) {
      return const HomePage();
    } else {
      return const LogInPage();
    }
  }
}