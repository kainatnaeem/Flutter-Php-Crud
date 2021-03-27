import 'package:FlutterAndPhp/details.dart';
import 'package:FlutterAndPhp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController ptitle;
  TextEditingController pdescription;
 
  void editData(){
    var url ="http://192.168.10.18:8080/flutterproject/editdata.php";
    http.post(url,body:{
      'id':widget.list[widget.index]['id'],
      'post_title':ptitle.text,
      'post_description':pdescription.text,
    });
  }
   @override
   void initState(){

     ptitle=TextEditingController(text: widget.list[widget.index]['post_title']);
     pdescription=TextEditingController(text:widget.list[widget.index]['post_description']);
     super.initState();
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : Text("Edit data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
TextField(
  controller: ptitle,
    decoration: InputDecoration(
            labelText: 'Enter Post title',
          fillColor: Colors.black,
        
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            contentPadding: EdgeInsets.all(3),
          ),
  
  ),SizedBox(height:10),
TextField(
  controller: pdescription,
     decoration: InputDecoration(
            labelText: 'Enter Post description',
          fillColor: Colors.black,
        
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            contentPadding: EdgeInsets.all(3),
          ),
  )
 , MaterialButton(
            child:Text("Submit Data"),
            color:Colors.amber,
            onPressed:(){
             editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder:(BuildContext context)=>MyHomePage()),
                );
            }
          )

          ],


        ),
      )
    );
  }
}