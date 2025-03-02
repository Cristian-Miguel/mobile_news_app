import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_news/app.dart';
import 'package:mobile_news/config/logger_config.dart';
import 'package:mobile_news/core/models/error_format.dart';
import 'package:mobile_news/features/auth/service/auth_service.dart';
import 'package:mobile_news/features/profile/ui/components/basic_option_button.dart';

class ProfileScreen extends ConsumerWidget {
  final AuthService _authService = AuthService();

  ProfileScreen({super.key});

  void _signOut(context, ref) async {
    final response = await _authService.signOut();
    if (response is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign in successful'),
          backgroundColor: Colors.green,
        ),
      );
      GoRouter.of(context).push("/");
      ref.read(bottomNavIndexProvider.notifier).state = 0;
    } else {
      final error = response as ErrorFormat;
      LoggerConfig.logger.e(error.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    bool isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          Container(
            width: size.width,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.dark_mode,
                        size: 32,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Dark mode',
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: ref.watch(darkModeProvider),
                    activeColor: Color(0xFF03315A),
                    activeTrackColor: Color(0xFF90CAF9),
                    inactiveThumbColor: Color(0xFF90CAF9),
                    inactiveTrackColor: Color(0xFF03315A),
                    onChanged: (value) {
                      ref.read(darkModeProvider.notifier).state = value;
                      isDarkMode = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.white : Colors.black,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Edit profile',
            icon: Icons.person,
            onPressed: () {},
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.white : Colors.black,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Notification',
            icon: Icons.notifications,
            onPressed: () {},
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.white : Colors.black,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Privacy',
            icon: Icons.privacy_tip,
            onPressed: () {},
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.white : Colors.black,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Security',
            icon: Icons.lock,
            onPressed: () {},
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.white : Colors.black,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Help & Support',
            icon: Icons.help,
            onPressed: () {},
          ),
          BasicOptionButton(
            iconColor: isDarkMode ? Colors.redAccent : Colors.red,
            arrowColor: isDarkMode ? Colors.white : Colors.black,
            title: 'Sign out',
            icon: Icons.logout,
            onPressed: () => _signOut(context, ref),
          ),
        ],
      ),
    );
  }
}
