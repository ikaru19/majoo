import 'package:flutter/material.dart';
import 'package:majoo_test/providers/HomeState.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/widget/v_widget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => HomeState(context,isFavorit: true),
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
            width: double.infinity,
            height: double.infinity,
            child: state.isList ? ListView.builder(
              itemCount: state.personList.length,
              itemBuilder: (c, i) {
                return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VText(
                            "name : ${state.personList[i].name}",
                            color: Colors.black,
                          ),
                          VText(
                            "height : ${state.personList[i].height}",
                            color: Colors.black,
                          ),
                          VText(
                            "mass : ${state.personList[i].mass}",
                            color: Colors.black,
                          ),
                          VText(
                            "gender : ${state.personList[i].gender}",
                            color: Colors.black,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          if(state.personList[i].isFav == 0){
                            state.personList[i].isFav = 1;
                          }else{
                            state.personList[i].isFav = 0;
                          }
                          state.updateFavorite(state.personList[i]);
                        },
                        child: Icon(
                            state.personList[i].isFav == 0 ? Icons.star_border : Icons.star
                        ),
                      )
                    ],
                  ),
                );
              },
            ) : GridView.builder(
              itemCount: state.personList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (c,i){
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VText(
                        "name : ${state.personList[i].name}",
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      VText(
                        "height : ${state.personList[i].height}",
                        color: Colors.black,
                      ),
                      VText(
                        "mass : ${state.personList[i].mass}",
                        color: Colors.black,
                      ),
                      VText(
                        "gender : ${state.personList[i].gender}",
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: (){
                            if(state.personList[i].isFav == 0){
                              state.personList[i].isFav = 1;
                            }else{
                              state.personList[i].isFav = 0;
                            }
                            state.updateFavorite(state.personList[i]);
                          },
                          child: Icon(
                              state.personList[i].isFav == 0 ? Icons.star_border : Icons.star
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  state.changeList();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: VColor.bgColorHome,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 50,
                  width: 50,
                  child: Icon(
                    state.isList ?Icons.grid_on_rounded : Icons.list_rounded  ,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  state.chageSort();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: VColor.bgColorHome,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.sort_by_alpha_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
