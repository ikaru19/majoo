import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:majoo_test/providers/AuthState.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/widget/v_widget.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => AuthState(context),
          child: Consumer<AuthState>(
            builder: (BuildContext context, AuthState state, Widget child) {
              return Center(child: _body(state));
            },
          ),
        ),
      ),
    );
  }

  Widget _body(AuthState state) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/star_wars_logo.json',
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          vLeadingButton(
            title: "Continue with Google",
            onTap: () {
              state.doLoginGoogle();
            },
            leading: SvgPicture.asset(
              "assets/images/google_icon.svg",
            ),
            color: VColor.red,
          ),
        ],
      ),
    );
  }
}
