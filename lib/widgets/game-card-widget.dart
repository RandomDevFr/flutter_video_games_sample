import 'package:flutter/material.dart';
import 'package:video_games/models/video-game.dart';

class GameCardWidget extends StatelessWidget {
  const GameCardWidget({
    Key key,
    @required this.video,
  }) : super(key: key);

  final VideoGame video;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(1.0, 3.0),
                  color: Theme.of(context).disabledColor,
                  blurRadius: 3.0),
            ]),
        child: Column(children: [
          Expanded(
            child: Container(
              child: Hero(
                tag: 'imageHero-${video.id}',
                child: Image.network(
                  video.backgroundImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Text(video.name,
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
        ]),
      ),
    );
  }
}
