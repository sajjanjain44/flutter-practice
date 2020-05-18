import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poki_youtube/pokedetail.dart';
import 'dart:convert';

import 'package:poki_youtube/pokemon.dart';

void main() => runApp(MaterialApp(
      title: "Pokemon App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedValue = json.decode(res.body);
//   print(res.body);

    pokeHub = PokeHub.fromJson(decodedValue);

    setState(() {});
//    print(pokeHub);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("POKE APP"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
      drawer: Drawer(),
      body: pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon
                  .map((Pokemon poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokeDetail(
                                          pokemon: poke,
                                        )));
                          },
                          child: Card(
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Hero(
                                  tag: poke.img,
                                  child: Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(poke.img)),
                                      )),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
