import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:majoo_test/providers/ProfileState.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/widget/v_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => ProfileState(context),
          child: Consumer<ProfileState>(
            builder: (BuildContext context, ProfileState state, Widget child) {
              return _body(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(ProfileState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: VColor.gradient2,
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.only(top: 180),
            decoration: BoxDecoration(
                color: VColor.bgColorHome,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                VText(
                  state.name ?? "Username",
                  fontSize: 24,
                ),
                VText(
                  state.email ?? "Email",
                  fontSize: 18,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: (){
                      state.logout();
                    },
                    child: VButton(
                     title: "Logout",
                      bold: true,
                      colorTitle: Colors.white,
                      colorBoxDecoration: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Container(
              child: CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                  state.profileUrl ?? "https://via.placeholder.com/150",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
