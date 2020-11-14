import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:majoo_test/models/Person.dart';
import 'package:majoo_test/models/people_response.dart';
import 'package:majoo_test/services/api_client.dart';
import 'package:majoo_test/services/api_url.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/utils/v_navigation.dart';
import 'package:majoo_test/utils/v_pref.dart';

class AuthState extends ChangeNotifier {
  BuildContext context;
  DbHelper dbHelper = DbHelper();

  var result;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  AuthState(this.context);

  doLoginGoogle() async {
    result = await _googleSignIn.signIn();
    if (result != null) {
      await getPeople();


    }
  }

  getPeople() {
    ApiClient().get(
        url: VUrl.people,
        callback: (status, message, res) {
          if (status == 200) {
            var response = PeopleResponse.fromJsonMap(res);
            response.results.forEach((element) {
              element.setFav(0);

              insertToLocalDB(element);
            });
            VPref.setEmail(result.email);
            VPref.setName(result.displayName);
            VPref.setPhotoUrl(result.photoUrl);
            VPref.setIsLogin(true);
            VNavigation.toNavigation(context);
          }
          notifyListeners();
          return;
        });
  }

  insertToLocalDB(Person person) async {

    print(person.isFav);
   await dbHelper.insert(person);
  }
}
