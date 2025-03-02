import 'package:flutter/material.dart';
import 'package:mobile_news/config/secure_storage.dart';
import 'package:mobile_news/config/token_manage.dart';
import 'package:mobile_news/features/auth/ui/screens/sign_in_screen.dart';
import 'package:mobile_news/features/profile/ui/screens/profile_screen.dart';

class AuthGateScreen extends StatefulWidget {
  const AuthGateScreen({super.key});

  @override
  State<AuthGateScreen> createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends State<AuthGateScreen> {
  bool _isAuthenticated = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    _isAuthenticated = !(await TokenManage().isTokenExpired());

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator()); // Loading state
    }
    return _isAuthenticated ? ProfileScreen() : SignInScreen();
  }
}
