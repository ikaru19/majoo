import 'package:flutter/material.dart';
import 'package:majoo_test/models/Person.dart';
import 'package:majoo_test/providers/HomeState.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/utils/v_popup.dart';
import 'package:majoo_test/widget/v_widget.dart';
import 'package:provider/provider.dart';

class DetailPersonScreen extends StatefulWidget {
  HomeState state;
  Person person;

  DetailPersonScreen(this.person, this.state);

  @override
  _DetailPersonScreenState createState() => _DetailPersonScreenState();
}

class _DetailPersonScreenState extends State<DetailPersonScreen> {

  @override
  void dispose() {
    widget.state.isEdit = false;
    super.dispose();
  }

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
                    initialValue: widget.person.name,
                    validator: (String v) =>
                        v.isEmpty ? "Nametidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.name = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Height",
                    initialValue: widget.person.height,
                    validator: (String v) =>
                        v.isEmpty ? "Height tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.height = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Mass",
                    initialValue: widget.person.mass,
                    validator: (String v) =>
                        v.isEmpty ? "Mass tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.mass = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Hair",
                    initialValue: widget.person.hair_color,
                    validator: (String v) =>
                        v.isEmpty ? "Hair tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.hair_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Skin",
                    initialValue: widget.person.skin_color,
                    validator: (String v) =>
                        v.isEmpty ? "Skin tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.skin_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Eye",
                    initialValue: widget.person.eye_color,
                    validator: (String v) =>
                        v.isEmpty ? "Eye tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.eye_color = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "Birth Year",
                    initialValue: widget.person.birth_year,
                    validator: (String v) =>
                        v.isEmpty ? "Birth Year tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.birth_year = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
                  ),
                  SizedBox(height: 20),
                  VInputText(
                    "gender",
                    initialValue: widget.person.gender,
                    validator: (String v) =>
                        v.isEmpty ? "Gender tidak boleh kosong" : null,
                    onSaved: (String v) => widget.person.gender = v,
                    capitalization: TextCapitalization.sentences,
                    enabled: state.isEdit,
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
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: VButton(
                      colorBoxDecoration: Colors.lightGreen,
                      colorTitle: Colors.white,
                      title: state.isEdit ? "Simpan" : "Edit",
                    ),
                    onTap: () {
                      if (state.isEdit) {
                        state.editPop(widget.person);
                      }else{
                        state.chageEdit();
                      }

                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){
                    state.deletePop(widget.person);
                  },
                  child: Container(
                    width: 100,
                    child: VButton(
                      colorBoxDecoration: VColor.red,
                      colorTitle: Colors.white,
                      title: "Hapus",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
