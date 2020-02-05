import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';
import 'package:note_keeper/view/note_detail.dart';

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
        if (notes[pos] == null) {return Card();}
        double p = notes[pos].priority.floorToDouble() / 10;
        return Card(
          color: Color.fromARGB(255, 255, 239, 232),
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, (255*p).floor(), (255*(1-p)).floor(), 255),
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
    var result = await Navigator.push(
        context,
      MaterialPageRoute(builder: (context) => NoteDetail(note)),
    );
    if (result == null) {return ;}
    if (isEdit) {
      notes.remove(note);
    }
    notes.add(result);
    notes.sort((a, b) => b.priority.compareTo(a.priority));
  }

}