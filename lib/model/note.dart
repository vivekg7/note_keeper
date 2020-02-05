class Note {
  int _id;
  int _priority;
  String _title;
  String _description;
  int _createdAt;
  int _modifiedAt;

  Note(this._title, this._priority, this._createdAt, [this._description]);
  Note.withId(this._id, this._title, this._priority, this._modifiedAt, [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get createdAt => _createdAt;
  int get modifiedAt => _modifiedAt;
  int get priority => _priority;

  set title(newTitle) {
    if ( newTitle.length < 255 ) {
      this._title = newTitle;
    }
  }
  set description(newMessage) {
    if ( newMessage.length < 255 ) {
      this._description = newMessage;
    }
  }
  set priority(newP) {
    if ( newP >= 0 && newP <= 10 ) {
      this._priority = newP;
    }
  }
  set createdAt(newD) {
    this._createdAt = newD;
  }
  set modifiedAt(newD) {
    this._modifiedAt = newD;
  }

  // Convert a Note Object to Map Object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic> ();
    if ( _id != null ) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['createdAt'] = _createdAt;
    map['modifiedAt'] = _modifiedAt;
    return map;
  }

  // Extract a Note Object from a Map Object
  Note.fromMapObject( Map<String, dynamic> map ) {
    this._id = map['id'];
    this._createdAt = map['createdAt'];
    this._modifiedAt = map["modifiedAt"];
    this._priority = map['priority'];
    this._title = map['title'];
    this._description = map['description'];
  }

}