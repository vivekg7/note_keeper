import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/note.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper (only once in whole app)
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colDes = 'description';
  String colmdDate = 'createdAt';
  String colcdDate = 'modifiedAt';
  String colTitle = 'title';
  String colPri = 'priority';


  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if ( _databaseHelper == null ) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {

    if ( _database == null ) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newV) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDes TEXT, $colPri INTEGER, $colcdDate TEXT, $colmdDate TEXT)');
  }

  // Fetch operation : get all notes from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPri ASC');
    // var result = await db.query(noteTable, orderBy: '$colPri ASC');

    return result;
  }

  // Insert operation :
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update operation :
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete operation :
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Get number of note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the Map List and Convert it to noteList
  Future <List<Note>> getNoteList() async {

    var noteMapList = await getNoteMapList();

    int count =  noteMapList.length;

    List<Note> noteList = List<Note>();

    for ( int i=0; i<count; i++ ) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;

  }

}