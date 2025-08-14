
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Headmap extends StatefulWidget{
  const Headmap({super.key});
  @override

  State<Headmap>createState()=>_Headmap();
}

class _Headmap extends State<Headmap>{
  @override
  Widget build(BuildContext context) {

    return HeatMapCalendar(
      colorMode: ColorMode.opacity,
      
      
      colorsets:{
        1:const Color.fromARGB(255, 88, 187, 111)
      },
       
      
      );
  }
}