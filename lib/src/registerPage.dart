import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_app/src/homePage.dart';
import 'package:post_app/src/loginPage.dart';

class registerPage extends StatefulWidget {
  static String id = 'registerPage';

  @override
  _registerPageState createState() => _registerPageState();

}

class _registerPageState extends State<registerPage> {
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
                            Text('Registrate',
                              style: TextStyle(
                                fontSize: 35.0,
                                color: Color(0xff2C2C2C),
                                fontFamily: 'rbold',
                              ),
                            ),

                            Text('Completa los datos',
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

                  Container(
                    margin: EdgeInsets.only(top: 30),
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
                                  Text('Usuario',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'rregular',
                                        color: Color(0xff3B3B3B)
                                    ),
                                  )
                                ],
                              ),
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0,),
                  _userTextField(),

                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                                  Text('Contraseña',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'rregular',
                                        color: Color(0xff3B3B3B)
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 10.0,),
                  _passWordTextField(),
                  SizedBox(height: 40.0,),
                  _bottonRegister(),
                  SizedBox(height: 15.0,),
                  _bottonBack(),
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              onChanged: (valu){},
            ),
          );
        }
    );
  }

  Widget _bottonRegister(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
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

  Widget _bottonBack(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 20.0),
              child: Text('Volver',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff3B3B3B),
                  fontFamily: 'rmedium',
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xff3B3B3B), width: 1)
            ),
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context){
                return loginPage();
              }));
            },
          );
        }
    );
  }
}