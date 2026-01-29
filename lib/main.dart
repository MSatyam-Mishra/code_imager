import 'package:code_imager/providers/editor_provider.dart';
import 'package:code_imager/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EditorProvider()),
      ],
      child: MaterialApp(
        title: 'Codimager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
