import 'package:flutter/material.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/ui/FavoritScreen.dart';
import 'package:majoo_test/ui/ProfileScreen.dart';
import 'package:majoo_test/widget/v_widget.dart';

import '../HomeScreen.dart';

class NavigationScreen extends StatefulWidget {
  

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with WidgetsBindingObserver {
  int currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _widgetOptions.add(HomeScreen());
    _widgetOptions.add(FavoriteScreen());
    _widgetOptions.add(ProfileScreen());
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _widgetOptions[currentIndex]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: 53,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    currentIndex = 0;
                    setState(() {});
                  },
                  child: ItemMenu(
                      isActiveTab: currentIndex == 0,
                      assetImage: Icons.home_rounded,
                      title: "Beranda"),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    currentIndex = 1;
                    setState(() {});
                  },
                  child: ItemMenu(
                      isActiveTab: currentIndex == 1,
                      assetImage: Icons.star,
                      title: "Favorit"),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    currentIndex = 2;
                    setState(() {});
                  },
                  child: ItemMenu(
                      isActiveTab: currentIndex == 2,
                      assetImage: Icons.emoji_people_rounded,
                      title: "Profile"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class ItemMenu extends StatelessWidget {
  final bool isActiveTab;
  final IconData assetImage;
  final String title;

  ItemMenu(
      {@required this.isActiveTab,
      @required this.assetImage,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5),
          Icon(
            assetImage,
            size: 20,
            color: isActiveTab ? Colors.red : Colors.grey,
          ),
          VText(
            title,
            fontSize: 11,
            color: isActiveTab ? Colors.red : Colors.grey,
            bold: true,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
