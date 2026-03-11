import 'package:flutter/material.dart';
import '../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        name: _emailController.text.split('@')[0],
        email: _emailController.text,
      );
      Navigator.pushReplacementNamed(context, '/home', arguments: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เข้าสู่ระบบ')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.account_circle, size: 100, color: Colors.indigo),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'อีเมล'),
                validator: (value) => (value == null || value.isEmpty) ? 'กรุณากรอกอีเมล' : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                validator: (value) => (value == null || value.isEmpty) ? 'กรุณากรอกรหัสผ่าน' : null,
              ),
              CheckboxListTile(
                title: const Text('จดจำฉันไว้'),
                value: _rememberMe,
                onChanged: (val) => setState(() => _rememberMe = val!),
              ),
              ElevatedButton(onPressed: _handleLogin, child: const Text('เข้าสู่ระบบ')),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('สมัครสมาชิก')),
            ],
          ),
        ),
      ),
    );
  }
}