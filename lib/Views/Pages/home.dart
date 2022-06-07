


import 'package:appcomictest/Services/service_api.dart';
import 'package:appcomictest/Views/Widgets/comiccard.dart';
import 'package:appcomictest/Views/Widgets/comiccardgrid.dart';
import 'package:appcomictest/Views/Pages/detail_comic.dart';
import 'package:flutter/material.dart';
import 'package:appcomictest/Models/issues_model.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IssuesModel? _issueModel;
  bool isGridView=true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _issueModel = await ApiService().getIssues();
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
        backgroundColor:Colors.white70,
        title: const Text('ComicBook',style: TextStyle(color: Colors.black,fontSize:24)),
        centerTitle: true,
             actions: <Widget>[
            if ( isGridView)
              IconButton(
                color: Colors.green,
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  setState(() {
                    isGridView = false;
                  });
                },
              )
            else
              IconButton(
                color: Colors.green,
                icon: const Icon(Icons.list),
                onPressed: () {
                  setState(() {
                    isGridView = true;
                  });
                },
              ),
           
          ],
      ),
       body: _issueModel == null || _issueModel!.results.isEmpty
          ? const Center(
            child: CircularProgressIndicator(),
            )
          : 
          isGridView ? 
          ListView.builder(
              itemCount: _issueModel!.results.length,
              itemBuilder: (context, index) {
              DateTime now = _issueModel!.results[index].dateAdded;
              String formattedDate = DateFormat.yMMMMd().format(now);
              String url= _issueModel!.results[index].apiDetailUrl;
              return ComicCard(imagenPath:_issueModel!.results[index].image.originalUrl, date:formattedDate, name:_issueModel!.results[index].volume.name+" #"+_issueModel!.results[index].issueNumber, onTap:(){ _openDetailPage(url);});
              },
            ):
              GridView.builder(
              itemCount: _issueModel!.results.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
              DateTime now = _issueModel!.results[index].dateAdded;
              String formattedDate = DateFormat.yMMMMd().format(now);
              String url= _issueModel!.results[index].apiDetailUrl;
              return ComicCardg(imagenPath:_issueModel!.results[index].image.originalUrl, date:formattedDate, name:_issueModel!.results[index].volume.name+" #"+_issueModel!.results[index].issueNumber, onTap:(){_openDetailPage(url);},);
              },
            ),
    );

   }
    _openDetailPage(comicId) {Navigator.push(context,MaterialPageRoute(builder:(context) => Detail(comicId),),

    );
  }
}


