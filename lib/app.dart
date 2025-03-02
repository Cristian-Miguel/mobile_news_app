import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_news/core/theme/AppTheme.dart';
import 'package:mobile_news/features/auth/ui/screens/auth_gate_screen.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/search/ui/screens/search_screen.dart';
import 'features/saved/ui/screens/saved_screen.dart';

// 📌 Bottom Navigation State Provider
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
final darkModeProvider = StateProvider<bool>((ref) => true);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      title: 'Veritas',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}

// 📌 Define Routes with a Shell for the Bottom Navigation Bar
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
        GoRoute(path: '/saved', builder: (context, state) => SavedScreen()),
        GoRoute(
            path: '/profile', builder: (context, state) => AuthGateScreen()),
      ],
    ),
  ],
);

// 📌 Main Layout with Bottom Navigation Bar
class MainLayout extends ConsumerWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
          switch (index) {
            case 0:
              context.go('/');
              ref.read(bottomNavIndexProvider.notifier).state = 0;
              break;
            case 1:
              context.go('/search');
              ref.read(bottomNavIndexProvider.notifier).state = 1;
              break;
            case 2:
              context.go('/saved');
              ref.read(bottomNavIndexProvider.notifier).state = 2;
              break;
            case 3:
              context.go('/profile');
              ref.read(bottomNavIndexProvider.notifier).state = 3;
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
