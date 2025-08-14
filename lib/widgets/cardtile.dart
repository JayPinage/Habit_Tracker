
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cardtile extends StatelessWidget{
  bool ischeck;
   
  final String task;
  final ValueChanged<bool?>ontick;

  
   Cardtile({super.key, required this.ischeck, required this.task, required this.ontick});
  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: Checkbox(value: ischeck,onChanged: ontick),
      title: Text(task),
      trailing: 
       Row(
        mainAxisSize: MainAxisSize.min,
    
          children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
          IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
          ],
        ),
      
    );
  }
}