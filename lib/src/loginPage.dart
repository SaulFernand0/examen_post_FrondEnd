import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_app/src/homePage.dart';
import 'package:post_app/src/registerPage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class loginPage extends StatefulWidget {
  static String id = 'loginPage';

  @override
  _loginPageState createState() => _loginPageState();

}

class _loginPageState extends State<loginPage> {
  Map data = {};

  List usuarioData = [];

  getUsuarios() async{
    http.Response response =  await http.get(Uri.parse('https://bd-post.herokuapp.com/auth/check'));
    var responsList = json.decode(response.body) as List;
    setState(() {
      responsList.forEach((element) {usuarioData.add(element); });
    });
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffFA6262),
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50),
                  child: Container(
                    margin: EdgeInsets.only(top: 75),
                    child: Image.asset('assets/images/logo1.png',
                      height: 60.0,
                      alignment: Alignment.topCenter,
                    ),
                  ),
            ),

            Container(child: Container(
              height: 580.0,
              margin: EdgeInsets.only(top: 220),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              ),
            ),
            ),

            Container(
              margin: EdgeInsets.only(top: 270),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bienvenido',
                              style: TextStyle(
                                fontSize: 35.0,
                                color: Color(0xff2C2C2C),
                                fontFamily: 'rbold',
                              ),
                            ),

                            Text('Inicia sesion para continuar',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff878787),
                                fontFamily: 'rregular',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0,),
                  _userTextField(),
                  SizedBox(height: 10.0,),
                  _passWordTextField(),
                  _checkSave(),
                  SizedBox(height: 40.0,),
                  _bottonLogin(),
                  SizedBox(height: 15.0,),
                  _bottonRegister(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _userTextField(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.wc),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                labelText: 'Usuario', labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'rregular',
                color: Color(0xff878787),
              ),
              ),
              onChanged: (valu){},
            ),
          );
        }
    );
  }

  Widget _passWordTextField(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Contraseña',
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'rregular',
                  color: Color(0xff878787),
                ),
              ),
              onChanged: (valu){},
            ),
          );
        }
    );
  }

  Widget _bottonLogin(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
              child: Text('Iniciar sesion',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'rmedium',
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color(0xff01CC7A),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return homePage();
              }));
            },
          );
        }
    );
  }

  Widget _bottonRegister(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 87.0, vertical: 20.0),
              child: Text('Registrarse',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'rmedium',
              ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color(0xff3B3B3B),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return registerPage();
              }));
            },
          );
        }
    );
  }

  Widget _checkSave(){
    return StreamBuilder(
      builder: (BuildContext contex, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Checkbox(onChanged: (bool? value) { },
                value: false,
                checkColor: Color(0xffFA6262),
              ),

              Container(
                margin: EdgeInsets.only(right: 50),
                child: Container(
                  child: Text('Recuerdame', style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'rregular',
                    color: Color(0xff878787),
                  ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      );
  }
}

