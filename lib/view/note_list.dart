import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  NoteListState createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Keeper"),
      ),
      body: Container(),
    );
  }

}