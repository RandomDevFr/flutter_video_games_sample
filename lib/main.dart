import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:video_games/models/theme-model.dart';
import 'package:video_games/models/video-game-response.dart';
import 'package:video_games/models/video-game.dart';
import 'package:video_games/widgets/game-card-widget.dart';
import 'package:video_games/widgets/game-detail-widget.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => ThemeModel(), child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<VideoGame>> fetchVideoGames() async {
    const gamesUrl = 'https://api.rawg.io/api/games';
    final response = await http.get(Uri.parse(gamesUrl));
    if (response.statusCode == 200) {
      return VideoGameResponse.fromJson(json.decode(response.body))
          .results
          .take(10)
          .toList();
    } else {
      return <VideoGame>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme.isBright ? theme.brightTheme : theme.darkTheme,
        home: Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text('RandomDev'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.autorenew),
                    onPressed: () {
                      theme.toggle();
                    }),
              ],
            ),
            body: FutureBuilder<List<VideoGame>>(
                future: fetchVideoGames(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data!.length > 0) {
                    final videos = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.all(0.0),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return GameDetailWidget(videos[index].id);
                            }));
                          },
                          child: GameCardWidget(video: videos[index]),
                        );
                      }
                    );
                  }
                  return Container();
                }),
          ),
        ),
      ),
    );
  }
}
