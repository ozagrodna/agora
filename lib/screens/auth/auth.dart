import 'package:flutter/material.dart';
import '../components/page_container/page_container.dart';

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitLogin,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}