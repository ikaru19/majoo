import 'dart:io';

import 'package:majoo_test/models/Person.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'contact.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);


    return todoDatabase;
  }

  //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contact (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        isFav INTEGER,
        name TEXT,
        height TEXT,
        mass TEXT,
        hair_color TEXT,
        skin_color TEXT,
        eye_color TEXT,
        birth_year TEXT,
        gender TEXT,
        homeworld TEXT,
        created TEXT,
        edited TEXT,
        url TEXT
      )
    ''');
  }



  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select(bool isAsc) async {
    print("select");
    Database db = await this.database;
    var mapList;
    if(isAsc){
      mapList  = await db.query('contact', orderBy: 'name ASC');
    }else{
      mapList  = await db.query('contact', orderBy: 'name DESC');
    }

    print(mapList.toString());
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectByID(int id) async {
    Database db = await this.database;
    var mapList = await db.query('contact', orderBy: 'id',where: 'id=?',whereArgs:[id]);
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectFavorit(bool isAsc) async {
    Database db = await this.database;
    var mapList;
    if(isAsc){
      mapList  = await db.query('contact', orderBy: 'name ASC' ,where: 'isFav=1');
    }else{
      mapList  = await db.query('contact', orderBy: 'name DESC' ,where: 'isFav=1');
    }

    return mapList;
  }

//create databases
  Future<int> insert(Person object) async {
    Database db = await this.database;
    int count = await db.insert('contact', object.toJson());
    return count;
  }
//update databases
  Future<int> update(Person object) async {
    Database db = await this.database;
    int count = await db.update('contact', object.toJson(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('contact',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<Person>> getContactListById(int id) async {
    var contactMapList = await selectByID(id);
    int count = contactMapList.length;
    List<Person> contactList = List<Person>();
    for (int i=0; i<count; i++) {
      contactList.add(Person.fromJsonMap(contactMapList[i]));
    }
    return contactList;
  }

  Future<List<Person>> getContactList(bool isAsc) async {

    var contactMapList = await select(isAsc);
    int count = contactMapList.length;
    List<Person> contactList = List<Person>();
    for (int i=0; i<count; i++) {

      contactList.add(Person.fromJsonMap(contactMapList[i]));

    }

    return contactList;
  }

  Future<List<Person>> getFavorit(bool isAsc) async {

    var contactMapList = await selectFavorit(isAsc);
    int count = contactMapList.length;
    List<Person> contactList = List<Person>();
    for (int i=0; i<count; i++) {

      contactList.add(Person.fromJsonMap(contactMapList[i]));

    }

    return contactList;
  }

   deleteDb() async {
    await _database.execute('''
      DELETE FROM contact
    ''');
  }


}