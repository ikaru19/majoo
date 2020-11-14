import 'package:flutter/material.dart';
import 'package:majoo_test/providers/HomeState.dart';
import 'package:majoo_test/widget/v_widget.dart';
import 'package:provider/provider.dart';

class AddPersonScreen extends StatefulWidget {
  HomeState state;

  AddPersonScreen(this.state);

  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider.value(
          value: widget.state,
          child: Consumer<HomeState>(
            builder: (BuildContext context, HomeState state, Widget child) {
              return _body(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(HomeState state) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 80),
          child: Form(
            key: state.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VInputText(
                    "Name",
                    initialValue: state.person.name,
                    validator: (String v) =>
                        v.isEmpty ? "Nametidak boleh kosong" : null,
                    onSaved: (String v) => state.person.name = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Height",
                    initialValue: state.person.height,
                    validator: (String v) =>
                        v.isEmpty ? "Height tidak boleh kosong" : null,
                    keyboardType: TextInputType.number,
                    onSaved: (String v) => state.person.height = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Mass",
                    initialValue: state.person.mass,
                    validator: (String v) =>
                        v.isEmpty ? "Mass tidak boleh kosong" : null,
                    keyboardType: TextInputType.number,
                    onSaved: (String v) => state.person.mass = v,
                    capitalization: TextCapitalization.sentences,
                    enabled:true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Hair",
                    initialValue: state.person.hair_color,
                    validator: (String v) =>
                        v.isEmpty ? "Hair tidak boleh kosong" : null,
                    onSaved: (String v) => state.person.hair_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Skin",
                    initialValue: state.person.skin_color,
                    validator: (String v) =>
                        v.isEmpty ? "Skin tidak boleh kosong" : null,
                    onSaved: (String v) => state.person.skin_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Eye",
                    initialValue: state.person.eye_color,
                    validator: (String v) =>
                        v.isEmpty ? "Eye tidak boleh kosong" : null,
                    onSaved: (String v) => state.person.eye_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Birth Year",
                    initialValue: state.person.birth_year,
                    validator: (String v) =>
                        v.isEmpty ? "Birth Year tidak boleh kosong" : null,
                    keyboardType: TextInputType.number,
                    onSaved: (String v) => state.person.birth_year = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "gender",
                    initialValue: state.person.gender,
                    validator: (String v) =>
                        v.isEmpty ? "Gender tidak boleh kosong" : null,
                    onSaved: (String v) => state.person.gender = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Expanded(
              child: InkWell(
                child: VButton(
                  colorBoxDecoration: Colors.lightGreen,
                  colorTitle: Colors.white,
                  title: "Simpan",
                ),
                onTap: () {
                  state.insertPop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
