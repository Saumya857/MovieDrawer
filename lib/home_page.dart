import 'package:flutter/material.dart';
import 'package:movielist/Add.dart';
import 'package:movielist/View.dart';
import 'package:movielist/database_helper.dart';
import 'package:movielist/models/movies.dart';
import 'package:movielist/widgets/drawer.dart';
// import 'package:movielist/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> movies;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    refreshMovies();
  }

  @override
  void dispose() {
    MoviesDatabase.instance.close();
    super.dispose();
  }

  Future refreshMovies() async {
    setState(() => isLoading = true);
    this.movies = await MoviesDatabase.instance.openAllMovie();
    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Drawer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddMovie()));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewPage(movieId: movie.id)));
              },
            );
          }),
      drawer: MyDrawer(),
    );
  }
}
