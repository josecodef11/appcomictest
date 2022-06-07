import 'package:flutter/material.dart';

class ComicCardg extends StatelessWidget {

  final String imagenPath;
  final String name;
  final String date;
  final void Function()onTap;

   const ComicCardg({
    Key? key,
    required this.imagenPath,
    required this.name,
    required this.date,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Card(
        elevation: 0,
        child: Column(
          children: [
           const SizedBox(
            height: 20,
            ),
            Container(
              height: 135,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imagenPath,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
             const SizedBox(
            height: 8,
            ),
            Text(name,style: const TextStyle(color: Colors.black,fontSize:14,fontWeight:FontWeight.bold, ) ,textAlign:TextAlign.center),
            const SizedBox(
            height: 5,
            ),
            Text(date,style: const TextStyle(color: Colors.black,fontSize:14)),
          ],
        ),
      ),
    );
  }
}