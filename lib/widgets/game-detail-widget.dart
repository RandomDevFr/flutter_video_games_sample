import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:video_games/models/game-detail.dart';
import 'package:video_games/models/theme-model.dart';

class GameDetailWidget extends StatelessWidget {
  final int id;
  GameDetailWidget(this.id);

  Future<GameDetail?> fetchGameDetail() async {
    final gamesUrl = 'https://api.rawg.io/api/games/$id';
    final response = await http.get(Uri.parse((gamesUrl)));
    if (response.statusCode == 200) {
      String source = Utf8Decoder().convert(response.bodyBytes);
      return GameDetail.fromJson(jsonDecode(source));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: fetchGameDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final gameDetail = snapshot.data as GameDetail;
              return Column(
                children: <Widget>[
                  Container(
                    child: Hero(
                      tag: 'imageHero-${this.id}',
                      child: Image.network(gameDetail.backgroundImage))
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0),
                      child: Text(
                        gameDetail.name,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(
                        children: [
                          Html(
                            data: gameDetail.description,
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<ThemeModel>(
                    builder: (context, theme, child) => Container(
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0),
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          theme.toggle();
                        },
                        child: Text('Switch Theme'),
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          }
        ),
      ),
    );
  }
}
