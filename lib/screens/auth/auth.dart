import 'package:flutter/material.dart';
import '../components/page_container/page_container.dart';
import '../home/home.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _submitLogin() {
    final isEmailValid = _validateEmail();
    final isPasswordValid = _validatePassword();

    if (isEmailValid && isPasswordValid) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      print('Login with $email / $password');
      // TODO: Call AuthService().login(...)
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    }
  }

  bool _validateEmail() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _setEmailError('Email is required');
      return false;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _setEmailError('Please enter a valid email address');
      return false;
    }

    _clearEmailError();
    return true;
  }

  bool _validatePassword() {
    final password = _passwordController.text;

    if (password.isEmpty) {
      _setPasswordError('Password is required');
      return false;
    }

    if (password.length < 8) {
      _setPasswordError('Password must be at least 8 characters');
      return false;
    }

    _clearPasswordError();
    return true;
  }

  void _setEmailError(String message) {
    setState(() {
      _emailError = message;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _emailError = null;
        });
      }
    });
  }

  void _clearEmailError() {
    setState(() {
      _emailError = null;
    });
  }

  void _setPasswordError(String message) {
    setState(() {
      _passwordError = message;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _passwordError = null;
        });
      }
    });
  }

  void _clearPasswordError() {
    setState(() {
      _passwordError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageContainer(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: 320, // Or whatever width you prefer
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'AGORA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),

                    const SizedBox(height: 4),
                    SizedBox(
                      height: 20,
                      child: (_emailError ?? _passwordError) != null
                          ? Text(
                              _emailError ?? _passwordError!,
                              style: const TextStyle(color: Colors.red),
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[850],
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),

                    ),

                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[850],
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),

                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: ElevatedButton(
                        onPressed: _submitLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6246FF),         // background color
                          foregroundColor: Colors.white,         // text color
                          padding: const EdgeInsets.symmetric(   // button padding
                            horizontal: 36,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(         // rounded corners
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 4,                          // slight shadow
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}