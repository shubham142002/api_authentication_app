import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    final token = await _authService.getToken();
    setState(() {
      _isAuthenticated = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isAuthenticated ? HomeScreen() : LoginScreen(),
    );
  }
}
