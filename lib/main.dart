import 'package:FlutterAndPhp/addData.dart';
import 'package:FlutterAndPhp/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter And Php',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  
  Future<List> getData()async{
    final response=await http.get("http://192.168.10.18:8080/flutterproject/getdata.php");
    return json.decode(response.body);
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter And Php"),
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton(
     child: new Icon(Icons.add),

        onPressed:()=>Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context)=>AddNewData()),
        )
      ),
      body:FutureBuilder<List>(
        future: getData(),
        builder: (context,data){
        if(data.hasError){
          print("error");   
        }
       
          if(data.hasData){
          return Items(list:data.data);
          }
          else{
             return CircularProgressIndicator();
          }
      }));}
}
class Items extends StatelessWidget{
  List list;
  Items({this.list});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemCount: list==null?0:list.length,
     itemBuilder: (ctx,i)
   {
     
 return ListTile(leading: Icon(Icons.layers_sharp),
     title:Text(list[i]['post_title']),
    subtitle:Text(list[i]['post_description']),
     onTap: ()=>Navigator.of(context).push(
       MaterialPageRoute(
         builder:(BuildContext context)=>Details(list:list,index:i),
       )
     ),);
     
   });
   
  }
}


