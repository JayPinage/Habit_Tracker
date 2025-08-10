
import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/cardtile.dart';

class Homescreen  extends StatefulWidget{
  const Homescreen({super.key});
  @override
  State<Homescreen>createState()=>_Homescreen();
}

class _Homescreen extends State<Homescreen>{
 bool check=false;

 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Cardtile(ischeck: check,  task: "Hello ", ontick: (bool? value) { 
        setState(() {
          check=value ?? false;

          if(check==true){
            print("hell");
          }
        });
       },),
    );
  }
}