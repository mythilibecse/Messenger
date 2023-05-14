import 'package:chatapp/chat/const.dart';
import 'package:chatapp/chat/resource.dart';
import 'package:flutter/material.dart';

class Grp_prf extends StatefulWidget {
  const Grp_prf({Key? key}) : super(key: key);

  @override
  State<Grp_prf> createState() => _Grp_prfState();
}

class _Grp_prfState extends State<Grp_prf> {
  bool _isSellect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
          itemCount: grp_avatarlist.length,
          itemBuilder: (context,index)=>
              Padding(
                padding: const EdgeInsets.only(right: 15,top: 10),
                child: GestureDetector(
                    onTap: (){
                     setState(() {
                       _isSellect = !_isSellect;
                     });
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                        color: _isSellect ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
                        child: avatar(imagepath: grp_avatarlist[index]['avatar'].toString()))),
              )
      ),
    );
  }
}
