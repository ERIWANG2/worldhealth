import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:worldhealth/Model/Medecin.dart';
import 'package:worldhealth/Util/AppConstant.dart';
import 'DetailMedecinController.dart';

class NosMedecins extends StatefulWidget {
  @override
  _NosMedecinsState createState() => _NosMedecinsState();
}

class _NosMedecinsState extends State<NosMedecins> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Nos médecins",style: TextStyle(fontSize: 14),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},)
        ],
      ),

      body: Container(
        child: FutureBuilder(
            future: _getMedecins(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){

                    if(snapshot.data==null){
                      return Container(
                        child: Center(child: CircularProgressIndicator()) ,
                      );

                    }else {

                      return ListTile(                       
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(AppConstant.url+"/images/"+snapshot.data[index].urlphoto),
                        ),
                        title: Text(snapshot.data[index].nom +" "+snapshot.data[index].prenom),
                        subtitle:Text(snapshot.data[index].specialite) ,
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>DetailMedecinController(snapshot.data[index])),
                          );
                        },
                      );
                    }
                  });
            }),
      ),
    );
  }

  //méthode pour chargement des médecins

  Future<List<Medecin>> _getMedecins() async{
    var data =await http.get(AppConstant.url+"/nosmedecins.php");
    var jsonData=json.decode(data.body);
    print("data :"+data.body);
    List<Medecin>medecins=[];

    //boucle pour recupérer les données
    for(var med in jsonData){
      //double pu=double.parse(med["prix"]);
      Medecin medecin=Medecin(med["cnom"],med["nom"],med["prenom"],med["specialite"], med["contact"],med["email"],med["lat"],
          med["lon"],med["urlphoto"],double.parse(med["prix"]));
      //ajout objet medecin dans la liste
      //print("List :"+medecin.nom+" "+medecin.email);
      medecins.add(medecin);
    }
    print(medecins.length);
    return medecins;
  }//fin getMedecin


}
