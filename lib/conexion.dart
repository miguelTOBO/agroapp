import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class MyHome extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHome> {
  late Future<QuerySnapshot> _futureData;

  @override

  void initState(){
    super.initState();
    _futureData = getData();
  }

  Future<QuerySnapshot>getData() async{
    return FirebaseFirestore.instance.collection('vendedor').get();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplicacion flutter'),
        ),
        body:FutureBuilder(
          future: _futureData,
          builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return Center(child:Text('Error: ${snapshot.error}'));
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    Map<String,dynamic>data=snapshot.data!.docs[index].data()as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: (){

                      },
                      child: ExpansionTile(
                        title: Text(data['correo']),
                        subtitle: Text(data['contraseña']),
                      ),
                    );
                  }
              );
            }
          },
        )
    );
  }
}