import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';

class NoteList extends StatefulWidget {
  NoteListState createState() => NoteListState();
}

class NoteListState extends State<NoteList> {

  List<Note> notes;

  @override
  void initState() {
    notes = List<Note> ();
    super.initState();
  }

  Widget _buildNotes() {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int pos) {
        double p = notes[pos].id*1.0 / 10;
        return Card(
          color: Colors.redAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255*p as int, 255*(1-p) as int, 0),
              child: Icon(Icons.event_note),
            ),
            title: Text(notes[pos].title),
            subtitle: Text(notes[pos].description),
            onTap: () {
              _gotoDetails(true, notes[pos]);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Keeper"),
      ),
      body: _buildNotes(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _gotoDetails(false, null);
        },
      ),
    );
  }

  _gotoDetails(bool isEdit, Note note) async {
    print("");
  }

}