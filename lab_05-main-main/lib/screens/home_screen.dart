import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  final dynamic user;
  const HomeScreen({super.key, this.user});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('คุณต้องการออกจากระบบใช่หรือไม่?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก')),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = user is User ? user.name : 'Guest';
    final userEmail = user is User ? user.email : 'No email';

    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าหลัก'),
        automaticallyImplyLeading: false,
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () => _showLogoutDialog(context))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            Text('ยินดีต้อนรับ $userName', style: const TextStyle(fontSize: 20)),
            Text('อีเมล: $userEmail'),
          ],
        ),
      ),
    );
  }
}