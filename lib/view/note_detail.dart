import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';

class NoteDetail extends StatefulWidget {

  final Note note;
  NoteDetail(this.note);

  NoteDetailState createState() => NoteDetailState();
}

class NoteDetailState extends State<NoteDetail> {

  double priority;
  Note note;

  TextEditingController _titleC, _descC;

  @override
  void initState() {
    _titleC = TextEditingController();
    _descC = TextEditingController();
    priority = widget.note==null?0:widget.note.priority.roundToDouble();
    _titleC.text = widget.note==null?"":widget.note.title;
    _descC.text = widget.note==null?"":widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
        actions: <Widget>[
          IconButton(
            icon: Text("Save"),
            onPressed: () {
              if (widget.note == null) {
                note = Note(_titleC.text, priority.round(), DateTime.now().millisecondsSinceEpoch, _descC.text);
              } else {
                note = Note.withId(widget.note.id, _titleC.text, priority.round(), DateTime.now().millisecondsSinceEpoch, _descC.text);
              }
              Navigator.pop(context, note);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text("Title"),
            TextField(
              controller: _titleC,
            ),
            Text("Priority: ${priority.round()}"),
            Slider(
              value: priority,
              min: 0,
              max: 10,
              onChanged: (newP) {
                setState(() => priority = newP);
              },
              divisions: 10,
              label: "$priority",
            ),
            Text("Description"),
            TextField(
              controller: _descC,
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }

}