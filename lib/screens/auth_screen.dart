import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = 'auth/screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void toLoginForm() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      _isLogin = true;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image.asset(
                    logo,
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isLogin ? 'Welcome' : 'Create Account',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email adress';
                                      }
                                      String pattern =
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Enter a valid email address';
                                      }
                                      return null;
                                    },
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      hintText: 'e-mail',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter password';
                                      }
                                      // String pattern =
                                      //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                      // RegExp regExp = RegExp(pattern);
                                      // if (!regExp.hasMatch(value)) {
                                      //   return 'Password must be at least 6 characters long and include at least one letter and one number';
                                      // }
                                      return null;
                                    },
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                      hintText: 'password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        _formKey.currentState!.validate();

                                        if (!_isLogin) {
                                          AuthServices _authServices =
                                              AuthServices();
                                          UserCredential? user =
                                              await _authServices
                                                  .createUserWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text,
                                            context,
                                          );
                                          if (user != null) {
                                            toLoginForm();
                                          }
                                        } else {
                                          print('hello dinshad');
                                          AuthServices _authServices =
                                              AuthServices();
                                          await _authServices.loginUser(
                                              _emailController.text,
                                              _passwordController.text,
                                              context);
                                        }
                                      },
                                      child: Text(
                                        _isLogin ? 'Login' : 'Sign Up',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: _toggleForm,
                                child: Text(
                                  _isLogin
                                      ? "Don't have an account? Sign up"
                                      : 'Already have an account? Login',
                                  style: const TextStyle(color: Colors.green),
                                )),
                          )
                        ],
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
