import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() async {
  await Flame.images.loadAll(<String>['sunset.jpg']);

  runApp(TransformGame().widget);
}

class TransformGame extends Game {
  Rect screen;
  Sprite sunset;

  TransformGame() {
    sunset = Sprite('sunset.jpg');
  }

  void render(Canvas canvas) {
    // return if the screen size is not yet determined
    if (screen == null) return;

    // draw a background color
    canvas.drawRect(screen, Paint()..color = Color(0xfff7f1e3));

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
  }

  void update(double t) {}

  void resize(Size size) {
    screen = Rect.fromLTWH(0, 0, size.width, size.height);
  }
}
