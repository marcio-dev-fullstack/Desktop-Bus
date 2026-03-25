import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // ESSA LINHA RESOLVE O ERRO VERMELHO DO SEU PRINT
    databaseFactory = databaseFactoryFfiWeb;
  }

  runApp(const BusApp());
}

class FrotaEscolarApp extends StatelessWidget {
  const FrotaEscolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento Frota CDA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF008000),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        // REMOVIDO O 'const' AQUI PARA EVITAR O ERRO DE COMPILAÇÃO
        '/facial_recognition': (context) => FacialRecognitionScreen(),
        '/manual_check': (context) => const ManualChecklistScreen(),
        '/summary': (context) => const SummaryScreen(),
      },
    );
  }
}