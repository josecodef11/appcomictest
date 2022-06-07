import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {

  final String imagenPath;
   final String name;

   const DetailCard({
    Key? key,
    required this.imagenPath,
    required this.name

  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(
        height: 20,
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imagenPath,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
         const SizedBox(
        height: 13,
        ),
        Text(name,style: const TextStyle(color: Colors.black,fontSize:25,fontWeight:FontWeight.bold, ) ,textAlign:TextAlign.center),
        const SizedBox(
        height: 10,
        ),
       
      ],
    );
  }
}