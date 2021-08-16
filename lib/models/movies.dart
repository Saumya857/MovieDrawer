import 'package:flutter/material.dart';

final String tableMovies = 'moviesDrawer';

class MoviesFields {
  static final List<String> values = [id, name, directorname, image];

  static final String id = '_id';
  static final String name = 'name';
  static final String directorname = 'director';
  static final String image = 'poster';
}

class Movie {
  final int id;
  final String name;
  final String directorname;
  final String image;
  // final String date;

  Movie(
      {required this.id,
      required this.name,
      required this.directorname,
      required this.image});

  Movie copy({
    int? id,
    String? name,
    String? directorname,
    String? image,
  }) =>
      Movie(
        id: id ?? this.id,
        name: name ?? this.name,
        directorname: directorname ?? this.directorname,
        image: image ?? this.image,
      );

  static Movie fromJson(Map<String, Object?> json) => Movie(
        id: json[MoviesFields.id] as int,
        name: json[MoviesFields.name] as String,
        directorname: json[MoviesFields.directorname] as String,
        image: json[MoviesFields.image] as String,
      );

  Map<String, Object?> toJson() => {
        MoviesFields.id: id,
        MoviesFields.name: name,
        MoviesFields.directorname: directorname,
        MoviesFields.image: image
      };
}
