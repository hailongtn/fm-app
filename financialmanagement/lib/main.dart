import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'providers/transaction_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/transaction_history_screen.dart';
import 'screens/add_transaction_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ],
        child: const FinancialManagementApp(),
      ),
    ),
  );
}

class FinancialManagementApp extends StatelessWidget {
  const FinancialManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const TransactionHistoryScreen(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state) => const AddTransactionScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Financial Management',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00B167)),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: router,
    );
  }
}
