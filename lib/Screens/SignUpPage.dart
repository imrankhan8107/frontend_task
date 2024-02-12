import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Components/CustomInputText.dart';
import 'package:task1/Providers/AuthProvider.dart';
import 'package:task1/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    UserAuthProvider authProvider = Provider.of<UserAuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up', style: kAppBarTextStyle),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputText(hintText: 'Enter your name', controller: nameController, label: 'Name',isPass: false),
                    CustomInputText(hintText: 'Enter your email', controller: emailAddress, label: 'Email',isPass: false),
                    CustomInputText(hintText: 'Enter your password', controller: password, label: 'Password',isPass: true),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          String isSignUp = await authProvider.signUp(
                              emailAddress.value.text, password.value.text);
                          if (authProvider.isLoggedIn) {
                            setState(() {
                              _isLoading = false;
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                              showSnackBar("SignUp success", context);
                            });
                          }
                          if (isSignUp != "Yes") {
                            setState(() {
                              showSnackBar("Sign Up failed: $isSignUp", context);
                              _isLoading = false;
                            });
                          }
                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child:
                            const Text('Already have an account? Log In here.'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
