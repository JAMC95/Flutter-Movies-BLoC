import 'package:flutter/material.dart';
import 'package:flutter_movies_bloc/ui/movies_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList()
      )
    );
  }
}
