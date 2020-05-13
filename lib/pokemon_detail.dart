import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/pokehub.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 110.0,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Height: ${pokemon.height}',
                      style: TextStyle(
                          color: Color(0xFF312285),
                          fontFamily: 'MontserratLight',
                          fontWeight: FontWeight.bold)),
                  Text('Weight: ${pokemon.weight}',
                      style: TextStyle(
                          color: Color(0xFF312285),
                          fontFamily: 'MontserratLight',
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'TYPES',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                            .map(
                              (t) => FilterChip(
                                  backgroundColor: Colors.amber,
                                  label: Text(
                                    t,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {}),
                            )
                            .toList() ??
                        [],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'WEAKNESS',
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                            .map((t) => FilterChip(
                                backgroundColor: Colors.green,
                                label: Text(
                                  t,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (b) {}))
                            .toList() ??
                        [],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Spawn Time: ${pokemon.spawnTime}',
                    style: TextStyle(
                        backgroundColor: Colors.yellowAccent,
                        color: Color(0xFF00AC46),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MontserratLight'),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pokemon.img),
                )),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          pokemon.name,
          style: TextStyle(
            letterSpacing: 3.0,
            fontFamily: 'pokeeFont',
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(
        context,
      ),
    );
  }
}
