import 'package:flutter/material.dart';
import 'package:sewa_lapangan/landing_page.dart';
import 'package:intl/date_symbol_data_local.dart';

// 1. Ubah fungsi main menjadi async
Future<void> main() async {
  // 2. Tambahkan dua baris ini untuk inisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewa Lapangan App',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}