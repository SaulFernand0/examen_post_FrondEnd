import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_app/src/profilePage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class homePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  _homePageState createState() => _homePageState();

}

class _homePageState extends State<homePage> {
  Map data = {};

  List postData = [];

// Listar
  getPosts() async{
    http.Response response =  await http.get(Uri.parse('https://bd-post.herokuapp.com/posts'));
    var responsMap = json.decode(response.body) as Map;
    var responsList = responsMap["posts"];
    setState(() {
      responsList.forEach((element) {postData.add(element); });
    });
  }

  ///Add Post
  Future<http.Response> addPost(String titulo, String descripcion, String fecha) async {
    var url = Uri.parse('https://bd-post.herokuapp.com/posting');
        Map data = {'titulo': titulo, 'descripcion': descripcion, 'fecha': fecha};
        var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  final TextEditingController titulo = TextEditingController();
  final TextEditingController descripcion = TextEditingController();
  final TextEditingController fecha = TextEditingController();


  //Update



  @override
  void initState(){
   super.initState();
   getPosts();
  }


  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 25),
                  child: Image.asset('assets/images/logo2.png',
                  height: 30.0,
                    alignment: Alignment.topLeft,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, right: 30),
                  child: GestureDetector(
                    child: Image.asset('assets/images/perfil1.png',
                      height: 50.0,
                      alignment: Alignment.topRight,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return profilePage();
                      }));
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0,),

            SizedBox(
              height: 715.0,
              child: RefreshIndicator(child: ListView.builder(
                shrinkWrap: true,
                itemCount: postData == null ? 0 : postData.length,
                padding: EdgeInsets.symmetric(horizontal: 25),
                itemBuilder: (BuildContext contexto, int index){
                  return Dismissible(key: ObjectKey(index),
                    child: Column(
                    children: [
                      Container(
                      margin: EdgeInsets.only(top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Título',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'rbold',
                                                color: Color(0xff3B3B3B),
                                              ),
                                            ),

                                            Text("${postData[index]["titulo"]}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'rregular',
                                                color: Color(0xff3B3B3B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        //margin: EdgeInsets.only(right: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Fecha',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'rbold',
                                                color: Color(0xff3B3B3B),
                                              ),
                                            ),
                                            Text("${postData[index]["fecha"]}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'rregular',
                                                color: Color(0xff3B3B3B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Descripción',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'rbold',
                                                color: Color(0xff3B3B3B),
                                              ),
                                            ),

                                            Container(
                                              child: Column(
                                                children: [
                                                  Text("${postData[index]["descripcion"]}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'rregular',
                                                      color: Color(0xff3B3B3B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),],
                  ),
                    onDismissed: (direction){
                      setState(() {
                        postData.removeAt(index);
                      });
                    }
                  );
                },), onRefresh: ()async{}
                ),
            ),
     ]),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3B3B3B),
        child: Icon(Icons.add),
        onPressed: () => _menuRegister(),
      ),
    ),
    );
}

//Menu emergente
void _menuRegister(){
    showModalBottomSheet(context: context, isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context){
      return Container(
        height: MediaQuery.of(context).size.height*0.65,
        child: Container(
          color: Color(0xff737373),
          child: Container(
            child: _register(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
            ),
          ),
        ),
      );
    });
}

    SingleChildScrollView _register(){
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20
                    ),
                    child: Text('Título',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'rbold',
                        color: Color(0xff3B3B3B),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Ingrese un título', labelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'rregular',
                        color: Color(0xff878787),
                      ),
                      ),
                      onChanged: (valu){},
                      controller: titulo,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 130, left: 20
                    ),
                    child: Text('Descripción',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'rbold',
                        color: Color(0xff3B3B3B),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 160),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text, maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Ingrese una descripción', alignLabelWithHint: true, labelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'rregular',
                        color: Color(0xff878787),
                      ),
                      ),
                      onChanged: (valu){},
                      controller: descripcion,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 320, left: 20
                    ),
                    child: Text('Fecha',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'rbold',
                        color: Color(0xff3B3B3B),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 350),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: 'Ingrese una fecha', labelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'rregular',
                        color: Color(0xff878787),
                      ),
                      ),
                      onChanged: (valu){},
                      controller: fecha,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 450, left: 20),
                    child: RaisedButton(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 128.0, vertical: 20.0),
                        child: Text('Publicar',
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
                        addPost(titulo.text.trim(), descripcion.text.trim(), fecha.text.trim());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}