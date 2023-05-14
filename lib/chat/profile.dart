import 'dart:io';
import 'dart:math';

import 'package:chatapp/Authenticate/auth.dart';
import 'package:chatapp/chat/home.dart';
import 'package:chatapp/notes/Home.dart';
import 'package:chatapp/todo/home_page.dart';
import 'package:chatapp/verification/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  final String username;
  final String email;
  const Profile({Key? key,required this.username,required this.email}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PlatformFile? pickfiles;
  late String result;
  bool profilepic = false;
  AuthService authService =AuthService();

  Future selectFile()async{
    await FilePicker.platform.pickFiles().then((value) {
      if(value != null){
        setState(() {
          pickfiles = value?.files.first;
          result = pickfiles!.path!;
          profilepic = true;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle:true, title: const Text("PROFILE",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),),backgroundColor: Theme.of(context).primaryColor),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children:<Widget> [
            Icon(Icons.account_circle,color:Theme.of(context).primaryColor,size: 150,),
            const SizedBox(
              height: 20,
            ),
            Text(widget.username,textAlign: TextAlign.center,style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const Home();
                }));
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.group),
              title: const Text("Groups",style: TextStyle(
                  color: Colors.black
              ),),
            ),
            ListTile(
              onTap: (){

              },
              selectedColor:Theme.of(context).primaryColor,
              selected: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.home),
              title: const Text("Profile",style: TextStyle(
                  color: Colors.black
              ),),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Notes(username: widget.username,email: widget.email,);
                }));
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.note_add_rounded),
              title: const Text("Notes",style: TextStyle(
                  color: Colors.black
              ),),
            ),
            ListTile(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return HomePage();
                 }));
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.list_alt),
              title: const Text("Todo List",style: TextStyle(
                  color: Colors.black
              ),),
            ),
            ListTile(
              onTap: ()async{

                showDialog(
                    barrierDismissible: false,
                    context: context, builder: (context){
                  return AlertDialog(
                    content: const Text("Are you sure you want to Logout?"),
                    title: const Text("Logout"),
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.cancel,color: Colors.red,)),
                      IconButton(onPressed: (){
                        authService.signout().whenComplete((){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return const Login();
                          }));
                        });
                      }, icon: const Icon(Icons.done,color: Colors.green,))
                    ],
                  );
                });
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout",style: TextStyle(
                  color: Colors.black
              ),),
            )

          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Center(
              child:Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4,color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: const AssetImage("images/login.png")
                      )
                    ),


                  ),
                ],
              )
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  color:Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(widget.username,style:const TextStyle(
                    fontSize: 17
                ),)
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.email,
                  color:Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(widget.email,textAlign: TextAlign.end,style:const TextStyle(
                    fontSize: 15
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
