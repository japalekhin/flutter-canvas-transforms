import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() async {
  await Flame.util.fullScreen();
  await Flame.images.loadAll(<String>[
    'sunset.jpg',
    'scene.jpg',
    'aero.png',
  ]);

  runApp(TransformGame().widget);
}

class TransformGame extends Game {
  Rect screen;
  Sprite sunset;
  Sprite scene;
  Sprite aero;

  TransformGame() {
    sunset = Sprite('sunset.jpg');
    scene = Sprite('scene.jpg');
    aero = Sprite('aero.png');
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

  void renderRotateHalfRad(Canvas canvas) {
    canvas.save();

    canvas.rotate(.5);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderScewHorizontalPositive(Canvas canvas) {
    canvas.save();

    canvas.skew(.25, 0);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderSkewVerticalPositive(Canvas canvas) {
    canvas.save();

    canvas.skew(0, .75);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderSkewHPositiveVNegative(Canvas canvas) {
    canvas.save();

    canvas.skew(.15, -.375);

    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));
    canvas.restore();
  }

  void renderMixed(Canvas canvas) {
    // save the original state
    canvas.save();

    // center the origin (then save this state)
    canvas.translate(screen.center.dx, screen.center.dy);
    canvas.save();

    // resize the canvas up by 2 (double)
    canvas.scale(2);

    // render image (with size compensation)
    canvas.translate(-100, -100);
    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));

    // restore back to just the centered origin
    canvas.restore();

    // rotate the canvas
    canvas.rotate(2);

    // render image again (with size compensation)
    canvas.translate(-100, -100);
    sunset.renderRect(canvas, Rect.fromLTWH(0, 0, 200, 200));

    // restore the original state();
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
    // renderRotateHalfRad(canvas);
    // renderScewHorizontalPositive(canvas);
    // renderSkewVerticalPositive(canvas);
    // renderSkewHPositiveVNegative(canvas);
    renderMixed(canvas);
  }

  void update(double t) {}

  void resize(Size size) {
    screen = Rect.fromLTWH(0, 0, size.width, size.height);
  }
}
