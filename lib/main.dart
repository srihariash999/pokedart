import 'package:flutter/material.dart';
import 'package:pokeapi/dao/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PokeDart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                  future: PokeAPI.getPokemonList(0, 10),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Pokemon> pokemonList = snapshot.data;
                      return Text(pokemonList[0].baseExperience.toString());
                    }
                  })
            ],
          ),
        ));
  }
}
