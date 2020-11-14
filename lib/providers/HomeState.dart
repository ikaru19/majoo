import 'package:flutter/material.dart';
import 'package:majoo_test/models/Person.dart';
import 'package:majoo_test/services/db_helper.dart';

class HomeState extends ChangeNotifier {
  BuildContext context;
  DbHelper dbHelper = new DbHelper();
  List<Person> personList = [];
  bool isList = true;
  bool isFavorit = false;
  bool isAsc = true;

  HomeState(this.context,{this.isFavorit}) {
      getData();
  }

  getData(){
    if(isFavorit){
      getFav();
    }else{
      getDB();
    }
  }


  changeList(){
    this.isList = !isList;
    notifyListeners();
  }

  chageSort(){
    this.isAsc = !isAsc;
    getData();
  }

  updateFavorite(Person person) async {
    await dbHelper.update(person);
    getData();
  }

  getDB() async {
    personList.clear();
    personList = await dbHelper.getContactList(isAsc);
    print(personList.length);
    notifyListeners();
  }

  getFav() async{
    personList.clear();
    personList = await dbHelper.getFavorit(isAsc);
    print(personList.length);
    notifyListeners();
  }
}
