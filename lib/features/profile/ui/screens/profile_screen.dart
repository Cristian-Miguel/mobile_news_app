import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_news/app.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          Text('Profile screen'),
          TextButton(
              onPressed: () {
                final isDarkMode = ref.watch(darkModeProvider);
                ref.read(darkModeProvider.notifier).state = !isDarkMode;
              },
              child: Text('Change Color')),
        ],
      ),
    );
  }
}
