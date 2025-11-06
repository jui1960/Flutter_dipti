import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'note_view_model.dart';



void main() {
  runApp(
      ChangeNotifierProvider(create:
          (_) => NoteViewModel(),
        child: const NoteApp(),
      )
  );
}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoteHomePage(),
    );
  }
}