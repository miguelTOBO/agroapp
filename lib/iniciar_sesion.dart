import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:splash/register.dart';
import 'package:splash/principal.dart';

class listados extends StatefulWidget {

  @override
  State<listados> createState() => _listadosState();
}

class _listadosState extends State<listados> {
  bool isCkec=false;
  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagenes/fondoo.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body:SingleChildScrollView(
                child:Column(
                    children: [

                      Center(
                        child:Container(
                          margin:EdgeInsets.only(top:50),
                          height: 230,
                          width: 230,
                          child: Image.asset(
                              'imagenes/logito.png',
                              fit: BoxFit.cover,
                              alignment: Alignment.center
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),

                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Container(
                          width: double.infinity,
                          height: 510,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(128, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Form(
                            key:null,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child:Text('Iniciar Sesion',
                                        style:TextStyle(
                                            fontFamily: 'Barlow',
                                            color: Color.fromARGB(255, 28, 62, 44),
                                            fontSize:25,
                                            fontWeight: FontWeight.w800
                                        )
                                    )
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child:TextFormField(
                                    controller: null,
                                    decoration: InputDecoration(
                                      filled:true,
                                      fillColor: Colors.transparent,
                                      hintText:'Usuario',
                                      hintStyle:TextStyle(
                                        color:Colors.black,
                                      ),
                                      prefixIcon:Icon(Icons.person,
                                        color:Colors.black,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2 ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 300,
                                  child: TextField(
                                    controller: null,
                                    obscureText:true,
                                    decoration: InputDecoration(
                                      filled:true,
                                      fillColor: Colors.transparent,
                                      hintText: 'Contraseña',
                                      hintStyle: TextStyle(
                                        color:Colors.black,
                                      ),
                                      prefixIcon:Icon(Icons.lock,
                                        color: Colors.black,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width:2 ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                Container(
                                    height: 50,
                                    width: 300,
                                    child:TextButton(onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>principal()));
                                    },
                                      child: Text('Iniciar Sesión',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      style:TextButton.styleFrom(
                                        backgroundColor: Color.fromARGB(255, 28, 62, 44),
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      SizedBox(height: 20),
                                      Checkbox(
                                        value: isCkec,
                                        activeColor: Color.fromARGB(255, 28, 62, 44),
                                        onChanged: (value){
                                          setState(() {
                                            isCkec=value!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isCkec=!isCkec;
                                          });
                                        },
                                        child:Text('Acepta terminos y condiciones',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text('¿No tienes cuenta?',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                        height: 44,
                                        width: 300,
                                        child:TextButton(onPressed: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>register()));
                                        },
                                          child: Text('Registrarse',
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 28, 62, 44),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          style:TextButton.styleFrom(
                                              backgroundColor: Colors.transparent
                                          ),

                                        )
                                    ),
                                    Center(
                                      child: Container(
                                        height: 2,
                                        width: 112,
                                        color: Color.fromARGB(255, 28, 62, 44),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )


                    ]
                )
            ),
        ),
      ),
    );
  }
}