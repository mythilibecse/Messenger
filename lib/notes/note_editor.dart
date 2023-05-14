import 'dart:math';
import 'package:chatapp/notes/appStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id= Random().nextInt(AppStyle.cardsColor.length);
  String date= DateTime.now().toString();
  TextEditingController _titleController=TextEditingController();
  TextEditingController _mainController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(backgroundColor: AppStyle.cardsColor[color_id],
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text("Add a new Note",style: TextStyle(color: Colors.black),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Note Title',
            ),
            style: AppStyle.mainTitle,
          ),
          SizedBox(height: 8.0,),
          Text(date,style: AppStyle.dateTitle,),
          SizedBox( height:28.0,),
          TextField(
            controller: _mainController,
            keyboardType:TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Note content'
            ),
            style: AppStyle.mainTitle,
          )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection("notes").add(
            {
              "note_title":_titleController.text,
              "creation_date":_titleController.text,
              "creation_date":date,
              "note_content":_mainController.text,
              "color_id":color_id
            }
          ).then((value){
            print(value.id);
            Navigator.pop(context);
          }).catchError((error){
            print("failed to add new notes due to $error");
          });
        },
        child: Icon(Icons.save),
      ),

    );
  }
}
