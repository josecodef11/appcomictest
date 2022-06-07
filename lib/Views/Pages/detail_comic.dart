

import 'package:appcomictest/Models/issue_model.dart';
import 'package:appcomictest/Services/service_api.dart';
import 'package:appcomictest/Views/Widgets/detailcardimage.dart';
import 'package:flutter/material.dart';



class Detail extends StatefulWidget {

  final String comicId;

  const Detail(this.comicId, {Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  IssueModel? _issueModel;
  bool isGridView=true;

  @override
  void initState() {
    super.initState();
    _getData();
 
  }

  void _getData() async {
    _issueModel = await ApiService().comicDetail(widget.comicId);
     Future.delayed(const Duration(microseconds: 1)).then((value) => setState(() {}));
    }
 

  @override
void dispose() {
super.dispose();
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
        color: Colors.black ),
        backgroundColor:Colors.white70,
        title: const Text('ComicBook',style: TextStyle(color: Colors.black,fontSize:24)),
        centerTitle: true,    
      ),
       body:_issueModel == null 
          ? const Center(
            child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Column(
              children: [
                DetailCard( imagenPath:_issueModel!.results.image.originalUrl, name:_issueModel!.results.volume.name+" #"+_issueModel!.results.issueNumber),
                const SizedBox(height: 25),
                const Text('Characters',style: TextStyle(color: Colors.black,fontSize:27)),
                Container(height: 1.5,
                color: Colors.black,
                width: 400,),
                const SizedBox(height: 25),
                GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap :true,
                itemCount: _issueModel!.results.characterCredits.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3),
                itemBuilder: (context, index) {
                return  Text(_issueModel!.results.characterCredits[index].name,style: const TextStyle(color: Colors.black,fontSize:20) ,textAlign:TextAlign.center);
                },
                ),
                const Text('Locations',style: TextStyle(color: Colors.black,fontSize:27)),
                Container(height: 1.5,
                color: Colors.black,
                width: 400,),
                const SizedBox(height: 25),
                Flex(
                direction:Axis.vertical,
                children:[ GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap :true,
                itemCount: _issueModel!.results.locationCredits.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3),
                itemBuilder: (context, index) {
                return  Text(_issueModel!.results.locationCredits[index].name,style: const TextStyle(color: Colors.black,fontSize:20) ,textAlign:TextAlign.center);
                },
                ),]
                ),
               
              ],
            ),
          )   
    );
    
  }
   
}



