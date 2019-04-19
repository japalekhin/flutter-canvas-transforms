import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() async {
  await Flame.util.fullScreen();
  await Flame.images.loadAll(<String>['sunset.jpg']);

  runApp(TransformGame().widget);
}

class TransformGame extends Game {
  Rect screen;
  Sprite sunset;

  TransformGame() {
    sunset = Sprite('sunset.jpg');
  }

  void renderCentered(Canvas canvas) {
    canvas.save();

    canvas.translate(screen.center.dx, screen.center.dy); // center screen
    canvas.translate(-100, -100); // compensate for image size

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderScaledUp2x(Canvas canvas) {
    canvas.save();

    canvas.scale(2);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderScaledDown(Canvas canvas) {
    canvas.save();

    canvas.scale(.5);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderScaledTall(Canvas canvas) {
    canvas.save();

    canvas.scale(1, 2);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderScaledShortFat(Canvas canvas) {
    canvas.save();

    canvas.scale(2, .5);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void render(Canvas canvas) {
    // return if the screen size is not yet determined
    if (screen == null) return;

    // draw a background color
    canvas.drawRect(screen, Paint()..color = Color(0xfff7f1e3));

    // mix and match

    // renderCentered(canvas);
    // renderScaledUp2x(canvas);
    // renderScaledDown(canvas);
    // renderScaledTall(canvas);
    // renderScaledShortFat(canvas);
  }

  void update(double t) {}

  void resize(Size size) {
    screen = Rect.fromLTWH(0, 0, size.width, size.height);
  }
}
