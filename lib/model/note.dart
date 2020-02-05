class Note {
  int _id;
  int _priority;
  String _title;
  String _description;
  DateTime _createdAt;
  DateTime _modifiedAt;

  Note(this._title, this._description, this._priority);
}