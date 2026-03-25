import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Para detectar o kIsWeb
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

// Importações das suas telas (certifique-se que os caminhos estão corretos)
import 'package:bus_desktop/screens/login_screen.dart';
import 'package:bus_desktop/screens/dashboard_screen.dart';
import 'package:bus_desktop/screens/facial_recognition_screen.dart';
import 'package:bus_desktop/screens/manual_checklist_screen.dart';
import 'package:bus_desktop/screens/summary_screen.dart';

void main() async {
  // 1. Garante que os widgets do Flutter estejam prontos
  WidgetsFlutterBinding.ensureInitialized();

  // 2. CORREÇÃO DO ERRO DO SEU LOG: Inicializa o banco para o Navegador
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }

  runApp(const FrotaEscolarApp());
}

class FrotaEscolarApp extends StatelessWidget {
  const FrotaEscolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransPorte CDA - Desktop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Verde oficial da SEMEC / Conceição do Araguaia
        primarySwatch: Colors.green,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      
      // Definição das Rotas do Sistema
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/facial_recognition': (context) => const FacialRecognitionScreen(),
        '/manual_check': (context) => const ManualChecklistScreen(),
        '/summary': (context) => const SummaryScreen(),
      },
      
      // Caso ocorra erro de navegação, volta para o Login
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}