import 'package:flutter/material.dart';
import 'package:gym/measurment.dart';
import 'measurment.dart';
class ReCard extends StatelessWidget {
  ReCard({required this.textshow,required this.imageshow});
  final String imageshow;
  final String textshow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MeasScreen()),
      )
      },
      child: Card(
        color: Color(0xffffeedd),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Padding (padding:const EdgeInsets.all(10) ,child: Image(image: AssetImage(imageshow),height: 100,width: 100,)),
            const SizedBox(width: 10,),
            Text(textshow,style: const TextStyle(fontSize: 20,color: Color(0xff0a1d37)),),
          ],
        ),
      ),
    );
  }
}