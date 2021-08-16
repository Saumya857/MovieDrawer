import 'package:flutter/material.dart';
import 'package:movielist/database_helper.dart';
import 'package:movielist/widgets/item_widget.dart';

import 'models/movies.dart';

class AddMovie extends StatefulWidget {
  final Movie? movie;

  const AddMovie({
    Key? key,
    this.movie,
  }) : super(key: key);
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String director;
  late String image;

  @override
  void initState() {
    super.initState();

    name = widget.movie?.name ?? '';
    director = widget.movie?.directorname ?? '';
    image = widget.movie?.image ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Add"),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: MovieItemWidget(
            name: name,
            director: director,
            poster: image,
            onChangedName: (name) => setState(() => this.name = name),
            onChangedDirector: (director) =>
                setState(() => this.director = director),
            onChangesPoster: (image) => setState(() => this.image = image),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        name.isNotEmpty && director.isNotEmpty && image.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Add'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.movie != null;

      if (isUpdating) {
        await updateMovie();
      } else {
        await addMovie();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateMovie() async {
    final movie =
        widget.movie!.copy(name: name, directorname: director, image: image);

    await MoviesDatabase.instance.update(movie);
  }

  Future addMovie() async {
    final movie = Movie(
      id: 1,
      name: name,
      directorname: director,
      image: image,
    );

    await MoviesDatabase.instance.create(movie);
  }
}
