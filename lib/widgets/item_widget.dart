
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  final String? name;
  final String? director;
  final String? poster;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedDirector;
  final ValueChanged<String> onChangesPoster;

  const MovieItemWidget({
    Key? key,
    this.name = '',
    this.director = '',
    this.poster = ' ',
    required this.onChangedName,
    required this.onChangedDirector,
    required this.onChangesPoster
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
              buildName(),
              SizedBox(height: 8),
              buildDirector(),
              SizedBox(height: 8),
              buildImage(),
              SizedBox(height: 8),
                ]
              ),
            ],
        ),
      )
  );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildDirector() => TextFormField(
        maxLines: 1,
        initialValue: director,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: 'Director Name',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (director) =>
            director != null && director.isEmpty ? 'The director name cannot be empty' : null,
        onChanged: onChangedDirector,
      );


 Widget buildImage() => TextFormField(
        maxLines: 2,
        initialValue: poster,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: 'Link of Image',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (poster) =>
            poster != null && poster.isEmpty ? 'The image link cannot be empty' : null,
        onChanged: onChangesPoster,
      );
}





























// import 'package:flutter/material.dart';
// import 'package:movielist/View.dart';
// import 'package:movielist/models/movies.dart';

// class ItemWidget extends StatelessWidget {
//   final Movie item;

//   const ItemWidget({Key? key, required this.item})
//       : assert(item != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         onTap: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => ViewPage()));
//         },
//         leading: Image.network(
//           '${item.image}',
//           fit: BoxFit.fitWidth,
//         ),
//         title: Text(item.name),
//         subtitle: Text(item.directorname),
//         // trailing: Text(item.date),
//       ),
//     );
//   }
// }
