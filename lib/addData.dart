import 'package:FlutterAndPhp/details.dart';
import 'package:FlutterAndPhp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddNewData extends StatefulWidget {
  @override
  _AddNewDataState createState() => _AddNewDataState();
}

class _AddNewDataState extends State<AddNewData> {
 
 TextEditingController ptitle=new TextEditingController();
 TextEditingController pdescription=new TextEditingController();
void addData(){
  var url = "http://192.168.10.18:8080/flutterproject/adddata.php";
  http.post(url,body:{
    "post_title": ptitle.text,
    "post_description": pdescription.text,
  });
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Add New Data"),
        backgroundColor: Colors.amber,
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            decoration: InputDecoration(
          labelText: 'Enter Post title',
        fillColor: Colors.black,
      
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.all(3),
        ),
            controller: ptitle,
         
          ),SizedBox(height:10),
            TextField(
                 controller: pdescription,
               decoration: InputDecoration(
          labelText: 'Enter Post description',
        fillColor: Colors.black,
      
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.all(3),
        ),
          ),
          MaterialButton(
            child:Text("Submit Data"),
            color:Colors.amber,
            onPressed:(){
              addData();
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder:(BuildContext context)=>MyHomePage()),
              //   );
   Navigator.pop(context)
;          }
          )


        ],),
      )
      
    );
  }
}