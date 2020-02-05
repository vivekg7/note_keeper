import 'package:flutter/material.dart';
import 'package:note_keeper/view/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Keeper',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NoteList(),
    );
  }
}