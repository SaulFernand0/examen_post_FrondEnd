import 'package:flutter/material.dart';
import 'package:post_app/src/homePage.dart';
import 'package:post_app/src/loginPage.dart';

class profilePage extends StatefulWidget {
  static String id = 'profilePage';

  @override
  _profilePage createState() => _profilePage();

}

class _profilePage extends State<profilePage> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left:30, top: 20),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    splashRadius: 30,
                    icon: Icon(Icons.arrow_back_ios, size: 30,
                      color: Color(0xff3B3B3B),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return homePage();
                      }));
                      },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 5, top: 20),
                  child: Text('Perfil',
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Color(0xff3B3B3B),
                        fontFamily: 'rbold'
                    ),),
                ),
              ],
            ),

            SizedBox(height: 120.0,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hola,',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: Color(0xff2C2C2C),
                          fontFamily: 'rbold',
                        ),
                      ),

                      Text('Usuario',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff878787),
                          fontFamily: 'rlight',
                        ),
                      ),
                    ],
                  ),

                  Image.asset('assets/images/perfil1.png',
                    height: 70.0,
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            ),

            SizedBox(height: 240.0,),

            Container(
              child: Column(
                children: [
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

  Widget _bottonLogin(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
              child: Text('Cerrar sesión',
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
            color: Color(0xff7D7D7D),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return loginPage();
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
              padding: EdgeInsets.symmetric(horizontal: 72.0, vertical: 20.0),
              child: Text('Eliminar cuenta',
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
            color: Color(0xffFA6262),
            onPressed: (){
              showDialog(context: context, builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text('Eliminar Cuenta', style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'rbold',
                  color: Color(0xff3B3B3B),
                ),),
                content: Text('¿Deseas eliminar tu cuenta? Esto será irreversible', style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'rregular',
                  color: Color(0xff3B3B3B),
                ),),
                actions: <Widget>[
                  FlatButton(child: Text('Si', style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'rmedium',
                    color: Color(0xff3B3B3B),
                  ),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return loginPage();
                    }));
                  },
                  ),
                  FlatButton(child: Text('Cancelar', style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'rmedium',
                    color: Color(0xff3B3B3B),
                  ),),
                    onPressed: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context){
                        return profilePage();
                      }));
                    },
                  ),
                ],
              ),);
            },
          );
        }
    );
  }
}