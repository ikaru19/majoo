import 'package:flutter/material.dart';
import 'package:majoo_test/models/Person.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/utils/v_popup.dart';

class HomeState extends ChangeNotifier {
  BuildContext context;
  Person person = Person();
  DbHelper dbHelper = new DbHelper();
  final formKey = GlobalKey<FormState>();

  List<Person> personList = [];
  bool isList = true;
  bool isFavorit = false;
  bool isAsc = true;
  bool isEdit = false;

  HomeState(this.context, {this.isFavorit}) {
    getData();
  }

  getData() {
    if (isFavorit) {
      getFav();
    } else {
      getDB();
    }
  }

  changeList() {
    this.isList = !isList;
    notifyListeners();
  }

  chageSort() {
    this.isAsc = !isAsc;
    getData();
  }

  chageEdit() {
    isEdit = !isEdit;
    notifyListeners();
  }

  editPop(Person person) {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    VPopUp(context)
        .alert("Apakah anda yakin ingin menyimpan ?")
        .then((value) async {
      if (value) {
        updatePerson(person);
        chageEdit();
      }
    });
  }

  insertPop(){
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    VPopUp(context)
        .alert("Apakah anda yakin ingin menyimpan ?")
        .then((value) async {
      if (value) {
        person.setFav(0);
        dbHelper.insert(person);
        person = Person();
        getData();
        Navigator.pop(context);
      }
    });
  }


  deletePop(Person person){
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    VPopUp(context)
        .alert("Apakah anda yakin ingin menghapus ?")
        .then((value) async {
      if (value) {
        dbHelper.delete(person.id);
        getData();
        Navigator.pop(context);
      }
    });
  }

  updatePerson(Person person) async {
    int rows = await dbHelper.update(person);
    print(rows);

    getData();
  }

  getDB() async {
    personList.clear();
    personList = await dbHelper.getContactList(isAsc);
    print(personList.length);
    notifyListeners();
  }

  getFav() async {
    personList.clear();
    personList = await dbHelper.getFavorit(isAsc);
    print(personList.length);
    notifyListeners();
  }
}
