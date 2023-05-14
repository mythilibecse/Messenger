import 'package:flutter/material.dart';

void showSnack(context,color,message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,style: const TextStyle(
        fontSize: 14
    ),),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(label:"ok", onPressed: () {  },textColor: Colors.white,),
  ));
}
class avatar extends StatelessWidget {
  final String imagepath;
  const avatar({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
              image: AssetImage(imagepath),
              fit: BoxFit.cover
          )
      ),
    );
  }
}

