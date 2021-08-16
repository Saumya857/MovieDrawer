import 'package:flutter/material.dart';
import 'package:movielist/database_helper.dart';

import 'models/movies.dart';

class ViewPage extends StatefulWidget {
  final int movieId;

  const ViewPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late Movie movie;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshMovie();
  }

  Future refreshMovie() async {
    setState(() => isLoading = true);
    this.movie = await MoviesDatabase.instance.openMovie(widget.movieId);
    setState(() =>isLoading=false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Image.network(movie.image),
            SizedBox(
              height: 20,
            ),
            Text(
              movie.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
                height: 20,
              ),
              Text(
              movie.directorname,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],),
      ),

      persistentFooterButtons: [
        Container(
         alignment: Alignment.center,
         child:  ElevatedButton(
             onPressed: () async{
               await MoviesDatabase.instance.delete(widget.movieId);
                 Navigator.of(context).pop();
             },
             child:
             Text("Delete",textAlign: TextAlign.center,),

            ),
         ),
      ],
    );
  }
}
