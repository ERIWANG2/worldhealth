import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'NosMedecins.dart';

class MainController extends StatefulWidget {
  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  @override
  Widget build(BuildContext context) {
    //intégration carousel
    Widget image_carousel=new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/docteur1.jpg"),
          AssetImage("images/docteur4.jpg"),
          AssetImage("images/docteur6.jpg"),
          AssetImage("images/docteur8.jpg"),
          AssetImage("images/med1.jpg"),
          AssetImage("images/med2.jpg"),
          AssetImage("images/med3.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text("WorldHealth"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed:(){
            //Navigator.of(context).pop();
          }),
          IconButton(icon: Icon(Icons.close,color: Colors.white,), onPressed:(){
           Navigator.of(context).pop();
          }),
        ],
      ),

      drawer: Drawer(
        child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("ERIC"),
                  accountEmail: Text("eriwang2@yahoo.fr"),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person,color: Colors.white,) ,
                    ),
                ),
              ),

              /*DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red,Colors.white])
                ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/logo.jpg"),
                    ),
                  ),
              ),*/

              InkWell(
              onTap: (){},
                child:
                ListTile(
                          title: Text("Accueil"),
                          leading: Icon(Icons.home),
                ),
              ),

              InkWell(
                onTap: (){},
                child:
                ListTile(
                  title: Text("Mon compte"),
                  leading: Icon(Icons.person),
                ),
              ),

              InkWell(
                onTap: (){
                },
                child:
                ListTile(
                  title: Text("Prendre un rendez-vous"),
                  leading: Icon(Icons.dashboard),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>NosMedecins()));
                },
                child:
                ListTile(
                  title: Text("Nos médecins"),
                  leading: Icon(Icons.home),
                ),
              ),

              InkWell(
                onTap: (){},
                child:
                ListTile(
                  title: Text("Accueil"),
                  leading: Icon(Icons.home),
                ),
              ),

              Divider(),

              InkWell(
                onTap: (){
                },
                child:
                ListTile(
                  title: Text("Paramètre"),
                  leading: Icon(Icons.settings,color: Colors.blue,),
                ),
              ),

              InkWell(
                onTap: (){},
                child:
                ListTile(
                  title: Text("Apropos"),
                  leading: Icon(Icons.help,color: Colors.green,),
                ),
              ),



            ],
        ),
      ),

      body: ListView(
        children: <Widget>[
          image_carousel
        ],
      )

    );
  }




}
