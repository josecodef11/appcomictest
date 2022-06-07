import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {

  final String imagenPath;
  final String name;
  final String date;
  final void Function()onTap;
  

   const ComicCard({
    Key? key,
    required this.imagenPath,
    required this.name,
    required this.date,
    required this.onTap
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Column(
          children: [
           const SizedBox(
            height: 20,
            ),
            Container(
              height: 300,
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
            height: 10,
            ),
            Text(name,style: const TextStyle(color: Colors.black,fontSize:16,fontWeight:FontWeight.bold, ) ,textAlign:TextAlign.center),
            const SizedBox(
            height: 6,
            ),
            Text(date,style: const TextStyle(color: Colors.black,fontSize:15)),
          ],
        ),
      ),
    );
  }
}