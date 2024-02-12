import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Components/CustomInputText.dart';
import 'package:task1/Providers/AuthProvider.dart';
import 'package:task1/constants.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    UserAuthProvider authProvider = Provider.of<UserAuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In',style: kAppBarTextStyle,),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputText(hintText: 'Enter your Email', controller: emailAddress, label: "Email", isPass: false),
                    CustomInputText(hintText: 'Enter your Password', controller: password, label: "Password", isPass: true),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          String isUserLoggedIn = await authProvider.login(
                              emailAddress.value.text, password.value.text);
                          if (authProvider.isLoggedIn) {
                            setState(() {
                              _isLoading = false;
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                              showSnackBar("Login success", context);
                            });
                          }
                          if (isUserLoggedIn != "Yes") {
                            setState(() {
                              showSnackBar("Login failed: $isUserLoggedIn", context);
                              _isLoading = false;
                            });
                          }
                        },
                        child: const Text('Log In'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/signUp');
                        },
                        child:
                            const Text('Don\'t have an account? Sign Up here.'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
