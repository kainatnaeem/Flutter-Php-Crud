import 'package:FlutterAndPhp/editdata.dart';
import 'package:FlutterAndPhp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  int index;
  List list;
Details({this.list,this.index});


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  void delete(){
    var url ="http://192.168.10.18:8080/flutterproject/deletedata.php";
    http.post(url, body:{
      'id':widget.list[widget.index],
    }
    
    );
  }
void confirm(){
  AlertDialog alertDialog =new AlertDialog(
    content :Text("Are you Sure?"),
    actions:<Widget>
    [
      MaterialButton( 
        child:Text("ok delete"),
      onPressed:(){
          delete();
        print("deleted");
        // Navigator.of(context).push(
        //       MaterialPageRoute(builder:(BuildContext context)=>MyHomePage()),
        //       );
      }
      
     


       )
       
       ,
       new RaisedButton(
          child: Text("CANCEL",style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
       
       
        ]
    );
  showDialog(context: context,child: alertDialog);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Edit/Delete")),
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Container(
       
                    child: Column(
              
              children: [
                Text(widget.list[widget.index]['post_title'],
                style:TextStyle(fontSize:20.0),),
                   Text(widget.list[widget.index]['post_description'],
                style:TextStyle(fontSize:20.0),),
              MaterialButton(
                child:Text("Edit"),
                color:Colors.amber
                ,
                onPressed:(){  Navigator.of(context).push(
                    MaterialPageRoute(builder:(BuildContext context)=>EditData(list:widget.list,index:widget.index)),
                    );},
              )
              ,

            MaterialButton(
                child:Text("delete",style: TextStyle(color: Colors.white)),
                color:Colors.black,
                onPressed:()=>confirm(),
              )
              
              ],
            ),
        
      ),
         ),
    );
  }
}