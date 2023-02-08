import 'package:e_com/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  LoginScreen({super.key});

  Future _login(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential phoneAuthCredential) async {
          Navigator.of(context).pop();
          Future<UserCredential> result =
              _auth.signInWithCredential(phoneAuthCredential);

          Future<User?> user = result.then((value) {
            return value.user;
          });

          if (user != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen(
                title: "Home Page",
              );
            }));
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print('${exception.message}');
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Enter the code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        final smsCode = _codeController.text.trim();
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode);
                        await _auth
                            .signInWithCredential(phoneAuthCredential)
                            .then((value) {
                          if (value.user != null) {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          title: "Home Page",
                                        )));
                          }
                        });
                      },
                      child: const Text("Confirm"),
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(fontSize: 22),
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 200, 197, 197))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 193, 189, 189))),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Mobile Number"),
              controller: _phoneController,
            ),
            ElevatedButton(
              onPressed: () {
                final phone = _phoneController.text.trim();
                _login(phone, context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
