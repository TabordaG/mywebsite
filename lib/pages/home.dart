import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:gabrielmoreira/widgets/bookList.dart';
import 'package:gabrielmoreira/widgets/dialog.dart';
import 'package:gabrielmoreira/widgets/profile_desktop.dart';
import 'package:gabrielmoreira/widgets/timeline.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services.dart';

PageController pageController = PageController(initialPage: 0);
int page = 0;
List<Icon> icons = [
  Icon(Icons.star),
  Icon(Icons.navigation),
  Icon(Icons.golf_course)
];
List<Color> colors = [Colors.blue, Colors.tealAccent, Colors.redAccent];
ScrollController _semicircleController = ScrollController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 245, 246, 1),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(28, 28, 28, 1),
              ),
              Row(
                children: <Widget>[
                  profileDesktop(context),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * (5 / 9),
                    color: Color.fromRGBO(238, 245, 246, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Projetos');
                                    // pageController.jumpToPage(0);
                                    pageController.animateToPage(0, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 0;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),                                  
                                  child: Text('PROJETOS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 0 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Livros');
                                    // pageController.jumpToPage(1);
                                    pageController.animateToPage(1, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 1;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),
                                  child: Text('LIVROS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 1 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1)
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Fotos');
                                    // pageController.jumpToPage(2);
                                    pageController.animateToPage(2, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 2;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),
                                  child: Text('FOTOS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 2 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  print('pressed About');
                                  // pageController.jumpToPage(3);
                                  pageController.animateToPage(3, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                  setState(() {
                                    page = 3;
                                  });
                                }, 
                                focusColor: Color.fromRGBO(28, 28, 28, 1),
                                splashColor: Color.fromRGBO(28, 28, 28, 1),
                                child: Text('SOBRE',
                                  style: GoogleFonts.pTSans(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.bold, 
                                    color: page == 3 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(child: Container()),
                              RaisedButton(
                                onPressed: () {
                                  print('FOLLOW');
                                  showAlertDialog(context);
                                },
                                color: Color.fromRGBO(28, 28, 28, 1),
                                splashColor: Color.fromRGBO(115,158,171, 1),
                                child: Text(
                                  'Follow',
                                  style: GoogleFonts.pTSans(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(238, 245, 246, 1),
                                  ),
                                ),
                              ),
                              Container(width: 20,),
                            ],
                          ),
                        ),    
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                            child: Container(
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                controller: pageController,
                                children: <Widget>[
                                  FutureBuilder(
                                    future: getProjects(),
                                    builder: (context, snapshot) {
                                      if(snapshot.hasError) return Text('Error');
                                      List<Project> projects = snapshot.data;
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return Text('Não conectado');
                                        case ConnectionState.waiting:
                                          return Center(child: CircularProgressIndicator(),);
                                        case ConnectionState.active:
                                          return Text('Iniciou mas não terminou');
                                        // case ConnectionState.done:
                                        //   return Text('Finalizado');
                                        default: 
                                          return orderTimeLine(projects, _semicircleController);
                                      }
                                    }
                                  ),
                                  Center(
                                    child: booklist(),
                                    // child: Text('Books'),
                                  ),
                                  Center(
                                    child: Text('Fotos'),
                                  ),
                                  Center(
                                    child: Text('Sobre'),
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),                
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,//-20,
            left: 0,//132,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sky.png'),
                  fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 - (MediaQuery.of(context).size.height * 0.3)*2.1 / 3, //138
            right: 70,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/TakeaBreak2.png'),
                  fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 0,//-20,
            left: (MediaQuery.of(context).size.width / 2) - 180,//132,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/teste.png'),
                  fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.3) - 75,
            left: MediaQuery.of(context).size.width / 6,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/profileImage.png"),
                ),
                border: Border.all(
                  width: 2, 
                  color: Color.fromRGBO(238, 245, 246, 1)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}